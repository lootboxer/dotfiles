--[[
Database Connection Setup for vim-dadbod-ui:

Global connections: `lua/envs/database.lua` (gitignored).
  Copy `lua/envs/database.example.lua` → `lua/envs/database.lua` and edit.

Project-local connections: `<project-root>/.nvim/db.lua` (gitignore it per project).
  Return `{ dbs = { { name = "...", url = "..." } } }`.
  These are appended to the global list at nvim startup (based on CWD).

Supported URL schemes: postgresql://, mysql://, sqlite:/path/to.db, mongodb://, ...

Usage:
  - <leader>db to toggle Database UI
  - <leader>df to find database buffers
  - In DBUI: 'o' to expand, 'S' to execute query, 'R' to rename
]]

local function load_dbs()
	local dbs = {}

	local ok, env = pcall(require, "envs.database")
	if ok and env and env.dbs then
		vim.list_extend(dbs, env.dbs)
	end

	local project_db = vim.fn.getcwd() .. "/.nvim/db.lua"
	if vim.fn.filereadable(project_db) == 1 then
		local chunk, err = loadfile(project_db)
		if chunk then
			local proj_ok, project = pcall(chunk)
			if proj_ok and type(project) == "table" and project.dbs then
				vim.list_extend(dbs, project.dbs)
			elseif not proj_ok then
				vim.notify("db.lua load error: " .. tostring(project), vim.log.levels.WARN)
			end
		else
			vim.notify("db.lua parse error: " .. tostring(err), vim.log.levels.WARN)
		end
	end

	vim.g.dbs = dbs
end

load_dbs()

vim.api.nvim_create_autocmd("DirChanged", {
	group = vim.api.nvim_create_augroup("dbui-project-dbs", { clear = true }),
	callback = load_dbs,
})

vim.api.nvim_create_user_command("DBReload", load_dbs, { desc = "Reload vim.g.dbs from envs + project" })

return {
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.db_ui_win_position = "right"
			vim.g.db_ui_winwidth = 40
		end,
		keys = {
			{ "<leader>db", "<cmd>DBUIToggle<cr>", desc = "Database UI" },
			{ "<leader>df", "<cmd>DBUIFindBuffer<cr>", desc = "DB Find Buffer" },
		},
	},
}
