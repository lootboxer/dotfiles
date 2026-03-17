return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",

			-- Test adapters
			"nvim-neotest/neotest-go",
			"marilari88/neotest-vitest",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-go")({
						experimental = {
							test_table = true,
						},
						args = { "-count=1", "-timeout=60s" },
					}),
					require("neotest-vitest"),
				},
			})
		end,
		keys = {
			{
				"<leader>tr",
				"<cmd>lua require('neotest').run.run()<cr>",
				desc = "Test Run Nearest",
			},
			{
				"<leader>tf",
				"<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
				desc = "Test Run File",
			},
			{
				"<leader>td",
				"<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
				desc = "Test Debug Nearest",
			},
			{
				"<leader>ts",
				"<cmd>lua require('neotest').summary.toggle()<cr>",
				desc = "Test Summary",
			},
			{
				"<leader>to",
				"<cmd>lua require('neotest').output.open({ enter = true })<cr>",
				desc = "Test Output",
			},
			{
				"<leader>tO",
				"<cmd>lua require('neotest').output_panel.toggle()<cr>",
				desc = "Test Output Panel",
			},
			{
				"<leader>tS",
				"<cmd>lua require('neotest').run.stop()<cr>",
				desc = "Test Stop",
			},
		},
	},
}

