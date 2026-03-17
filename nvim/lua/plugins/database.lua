--[[
Database Connection Setup for Postgres:

Option 1: Global configuration in init.lua or separate config file
  vim.g.dbs = {
    { name = 'dev', url = 'postgresql://user:password@localhost:5432/dbname' },
    { name = 'staging', url = 'postgresql://user:password@staging.example.com:5432/dbname' },
  }

Option 2: Use environment variables
  vim.g.dbs = {
    { name = 'dev', url = vim.env.DATABASE_URL },
  }

Option 3: Project-local configuration (recommended for team projects)
  Create .db_connections file in project root (add to .gitignore):

  return {
    { name = 'local', url = 'postgresql://localhost:5432/mydb' },
    { name = 'dev', url = 'postgresql://dev.example.com:5432/mydb' },
  }

  Then load it conditionally:
  local ok, connections = pcall(dofile, vim.fn.getcwd() .. '/.db_connections')
  if ok then
    vim.g.dbs = connections
  end

After setup, use:
  - <leader>db to toggle Database UI
  - <leader>df to find database buffers
  - In DBUI: press 'o' to expand, 'S' to execute query, 'R' to rename
]]

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

