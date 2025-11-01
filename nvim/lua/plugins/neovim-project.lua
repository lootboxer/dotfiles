local config = require("envs.neovim-project")

return {
	"coffebar/neovim-project",
	opts = {
		projects = config.projects or {},
		picker = {
			type = "telescope",
		},
		-- Last project configuration
		last_session_on_startup = true, -- automatically load last project on startup
		-- Dashboard integration (if you use dashboard)
		dashboard_mode = true,
	},
	init = function()
		-- enable saving the state of plugins in the session
		vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
	end,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope.nvim", tag = "0.1.4" },
		{ "Shatur/neovim-session-manager" },
	},
	lazy = false,
	priority = 100,
	keys = {
		{ "<leader>pp", "<CMD>Telescope neovim-project discover<CR>", desc = "Project Discover" },
		{ "<leader>ph", "<CMD>Telescope neovim-project history<CR>", desc = "Project History" },
		{ "<leader>pr", "<CMD>NeovimProjectLoad<CR>", desc = "Go to Project Root" },
	},
}
