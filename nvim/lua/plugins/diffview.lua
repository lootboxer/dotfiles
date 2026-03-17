return {
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
		keys = {
			{ "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Git Diff View" },
			{ "<leader>gH", "<cmd>DiffviewFileHistory %<cr>", desc = "Git File History" },
			{ "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "Git Branch History" },
			{ "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Close Diff View" },
		},
		config = true,
	},
}

