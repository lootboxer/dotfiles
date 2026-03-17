return {
	{
		"mistweaverco/kulala.nvim",
		config = function()
			require("kulala").setup()
		end,
		keys = {
			{ "<leader>rr", "<cmd>lua require('kulala').run()<cr>", desc = "REST Run Request" },
			{ "<leader>ra", "<cmd>lua require('kulala').run_all()<cr>", desc = "REST Run All" },
			{ "<leader>ri", "<cmd>lua require('kulala').inspect()<cr>", desc = "REST Inspect" },
			{ "<leader>rc", "<cmd>lua require('kulala').copy()<cr>", desc = "REST Copy as cURL" },
		},
	},
}

