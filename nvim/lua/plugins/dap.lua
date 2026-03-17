return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",
			"leoluz/nvim-dap-go", -- Go debugging
			"mxsdev/nvim-dap-vscode-js", -- JavaScript/TypeScript/Vue debugging
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- Setup DAP UI
			dapui.setup()

			-- Setup Go debugging
			require("dap-go").setup()

			-- Setup JavaScript/TypeScript/Vue debugging
			require("dap-vscode-js").setup({
				debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
				adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
			})

			-- Configure debugger for JavaScript/TypeScript/Vue
			for _, language in ipairs({ "typescript", "javascript", "vue" }) do
				dap.configurations[language] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch file",
						program = "${file}",
						cwd = "${workspaceFolder}",
					},
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach",
						processId = require("dap.utils").pick_process,
						cwd = "${workspaceFolder}",
					},
					{
						type = "pwa-chrome",
						request = "launch",
						name = "Launch Chrome",
						url = "http://localhost:3000",
						webRoot = "${workspaceFolder}",
					},
				}
			end

			-- Setup virtual text
			require("nvim-dap-virtual-text").setup()

			-- Auto-open UI
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
		keys = {
			{
				"<leader>dt",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Debug Toggle Breakpoint",
			},
			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
				desc = "Debug Continue",
			},
			{
				"<leader>dC",
				function()
					require("dap").run_to_cursor()
				end,
				desc = "Debug Run to Cursor",
			},
			{
				"<leader>di",
				function()
					require("dap").step_into()
				end,
				desc = "Debug Step Into",
			},
			{
				"<leader>do",
				function()
					require("dap").step_over()
				end,
				desc = "Debug Step Over",
			},
			{
				"<leader>dO",
				function()
					require("dap").step_out()
				end,
				desc = "Debug Step Out",
			},
			{
				"<leader>db",
				function()
					require("dap").step_back()
				end,
				desc = "Debug Step Back",
			},
			{
				"<leader>dr",
				function()
					require("dap").restart()
				end,
				desc = "Debug Restart",
			},
			{
				"<leader>du",
				function()
					require("dapui").toggle()
				end,
				desc = "Debug Toggle UI",
			},
		},
	},
}

