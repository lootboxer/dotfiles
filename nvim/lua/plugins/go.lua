return {
	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup({
				lsp_cfg = false, -- Don't override gopls
				lsp_inlay_hints = {
					enable = true,
				},
				luasnip = true,
			})

			-- Auto-format on save is handled by conform.nvim
			-- Removed to avoid double formatting conflict
			-- local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
			-- vim.api.nvim_create_autocmd("BufWritePre", {
			-- 	pattern = "*.go",
			-- 	callback = function()
			-- 		require("go.format").goimports()
			-- 	end,
			-- 	group = format_sync_grp,
			-- })
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()',
	},
}

