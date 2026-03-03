return {
	"windwp/nvim-ts-autotag",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true, -- Auto close tags
				enable_rename = true, -- Auto rename pairs of tags
				enable_close_on_slash = false, -- Auto close on trailing </
			},
			-- Specify which filetypes to enable
			filetypes = {
				"html",
				"xml",
				"vue",
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
				"svelte",
				"php",
			},
			-- Skip tags (don't auto-close/rename)
			skip_tags = {
				"area",
				"base",
				"br",
				"col",
				"command",
				"embed",
				"hr",
				"img",
				"slot",
				"input",
				"keygen",
				"link",
				"meta",
				"param",
				"source",
				"track",
				"wbr",
				"menuitem",
			},
		})
	end,
}
