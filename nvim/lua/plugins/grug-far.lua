return {
	"MagicDuck/grug-far.nvim",
	cmd = "GrugFar",
	opts = {
		headerMaxWidth = 80,
	},
	keys = {
		{
			"<leader>sr",
			function()
				require("grug-far").open({ transient = true })
			end,
			mode = "n",
			desc = "Search and Replace",
		},
		{
			"<leader>sr",
			function()
				require("grug-far").open({ transient = true, visualSelectionUsedAsSearchString = true })
			end,
			mode = "v",
			desc = "Search and Replace (selection)",
		},
		{
			"<leader>sR",
			function()
				require("grug-far").open({
					transient = true,
					prefills = { search = vim.fn.expand("<cword>") },
				})
			end,
			mode = "n",
			desc = "Search and Replace (word)",
		},
	},
}
