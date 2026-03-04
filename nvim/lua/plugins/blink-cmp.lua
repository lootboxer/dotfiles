return { -- Autocompletion
	"saghen/blink.cmp",
	dependencies = {
		"L3MON4D3/LuaSnip",
	},
	event = "InsertEnter",
	version = "*",
	opts = {
		-- Use LuaSnip as the snippet engine so blink.cmp surfaces LuaSnip snippets
		snippets = {
			preset = "luasnip",
		},
		keymap = {
			preset = "super-tab",
			--["<C-i>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" },
			["<Tab>"] = { "accept", "fallback" },
			-- ["<C-k>"] = { "select_prev", "fallback" },
			-- ["<C-j>"] = { "select_next", "fallback" },
			["<C-k>"] = { "scroll_documentation_up", "fallback" },
			["<C-j>"] = { "scroll_documentation_down", "fallback" },
		},
		sources = {
			default = { "lsp", "buffer", "path", "snippets" },
			per_filetype = {
				lua = { "lsp", "buffer", "path", "snippets" },
				vue = { "lsp", "buffer", "path", "snippets" },
			},
			providers = {
				lsp = {
					name = "LSP",
					module = "blink.cmp.sources.lsp",
					score_offset = 90,
				},
				buffer = {
					name = "Buffer",
					module = "blink.cmp.sources.buffer",
					score_offset = 5,
					opts = {
						max_items = 5,
						min_keyword_length = 3,
					},
				},
				path = {
					name = "Path",
					module = "blink.cmp.sources.path",
					score_offset = 3,
					opts = {
						trailing_slash = false,
						label_trailing_slash = true,
						get_cwd = function(context)
							return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
						end,
						show_hidden_files_by_default = false,
					},
				},
				snippets = {
					name = "Snippets",
					module = "blink.cmp.sources.snippets",
					score_offset = 80,
				},
			},
		},
		completion = {
			accept = {
				auto_brackets = {
					enabled = true,
				},
			},
			list = {
				max_items = 200,
			},
			menu = {
				enabled = true,
				min_width = 15,
				max_height = 10,
				border = "single",
				scrollbar = true,
				scrolloff = 2,
				draw = {
					treesitter = { "lsp" },
					columns = {
						{ "kind_icon" },
						{ "label", "label_description", gap = 1 },
						{ "source_name" },
					},
					components = {
						kind_icon = {
							text = function(ctx)
								return ctx.kind_icon .. ctx.icon_gap
							end,
							highlight = "CmpItemKind",
						},
						label = {
							width = { fill = true, max = 60 },
							text = function(ctx)
								return ctx.label .. ctx.label_detail
							end,
							highlight = "CmpItemAbbr",
						},
						label_description = {
							width = { max = 30 },
							text = function(ctx)
								return ctx.label_description
							end,
							highlight = "CmpItemAbbrMatch",
						},
						source_name = {
							width = { max = 30 },
							text = function(ctx)
								return "[" .. ctx.source_name .. "]"
							end,
							highlight = "CmpItemMenu",
						},
					},
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
				update_delay_ms = 50,
				treesitter_highlighting = true,
				window = {
					min_width = 10,
					max_width = 80,
					max_height = 20,
					border = "single",
					scrollbar = true,
				},
			},
			ghost_text = {
				enabled = true,
			},
		},
		signature = {
			enabled = true,
			window = {
				min_width = 1,
				max_width = 80,
				max_height = 10,
				border = "single",
				scrollbar = true,
			},
		},
		fuzzy = {
			frecency = { enabled = true },
			use_proximity = true,
			sorts = { "label", "kind", "score" },
			prebuilt_binaries = {
				download = true,
				force_version = nil,
			},
		},
	},
	config = function(_, opts)
		require("blink.cmp").setup(opts)

		local ls = require("luasnip")

		-- Extend filetypes so LuaSnip surfaces snippets across related languages
		ls.filetype_extend("vue", { "html", "javascript", "typescript", "css" })
		ls.filetype_extend("typescript", { "javascript" })
		ls.filetype_extend("javascriptreact", { "javascript" })
		ls.filetype_extend("typescriptreact", { "typescript", "javascript" })

		-- Load LuaSnip Lua-format snippets from the config snippets directory
		require("luasnip.loaders.from_lua").lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets" })
	end,
}
