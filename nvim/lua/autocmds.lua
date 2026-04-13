-- Autocmds for better Vue support

-- Ensure proper treesitter highlighting in Vue template sections
vim.api.nvim_create_autocmd("FileType", {
	pattern = "vue",
	callback = function()
		-- Ensure HTML injection is working in Vue templates
		vim.treesitter.language.register("html", "vue")
	end,
	desc = "Register HTML language for Vue templates",
})
