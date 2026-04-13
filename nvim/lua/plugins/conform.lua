return { -- Autoformat
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	config = function()
		require("conform").setup({
			-- format_on_save = { timeout_ms = 500, lsp_format = 'fallback' },
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports" }, -- gofmt is redundant (goimports includes it)
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				less = { "prettier" },
				html = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				vue = { "prettier" },
				sql = { "sql_formatter" },
			},
			formatters = {
				prettier = {
					-- This ensures Prettier is only used if a .prettierrc* file is found
					-- in the current working directory or its ancestors.
					-- This defines the root files to search for when determining the project root
					-- and thus where to look for .prettierrc* files.
					cwd = require("conform.util").root_file({
						".prettierrc",
						".prettierrc.json",
						".prettierrc.yml",
						".prettierrc.yaml",
						".prettierrc.json5",
						".prettierrc.js",
						".prettierrc.cjs",
						".prettierrc.mjs",
						".prettierrc.toml",
						"prettier.config.js",
						"prettier.config.cjs",
						"prettier.config.mjs",
					}),
				},
			},
		})
	end,
}
