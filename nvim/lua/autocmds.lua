-- Autocmds for better Vue support with nvim-ts-autotag

-- Ensure nvim-ts-autotag works properly in Vue files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "vue",
	callback = function()
		-- Force enable autotag for vue files
		vim.b.ts_autotag_enabled = true
	end,
	desc = "Enable autotag for Vue files",
})

-- Additional autocmd to ensure proper treesitter highlighting in Vue template sections
vim.api.nvim_create_autocmd("FileType", {
	pattern = "vue",
	callback = function()
		-- Get treesitter parser
		local ts_utils_ok, ts_utils = pcall(require, "nvim-treesitter.ts_utils")
		if not ts_utils_ok then
			return
		end

		-- Ensure HTML injection is working
		vim.treesitter.language.register("html", "vue")
	end,
	desc = "Register HTML language for Vue templates",
})

