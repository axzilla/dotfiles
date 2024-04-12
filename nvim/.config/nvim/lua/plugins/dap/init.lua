return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
		"theHamsta/nvim-dap-virtual-text",
		"mxsdev/nvim-dap-vscode-js",
		"nvim-neotest/nvim-nio",
		{
			"microsoft/vscode-js-debug",
			version = "1.x",
			-- HACK: Had to install it manually!
			run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
		},
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("nvim-dap-virtual-text").setup()
		dapui.setup({})

		require("plugins.dap._go").setup()
		require("plugins.dap._vscodejs").setup()

		vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Debug: Step Into" })
		vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Debug: Step Over" })
		vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "Debug: Step Out" })
		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug: Start/Continue" })
		vim.keymap.set("n", "<leader>dq", dap.disconnect, { desc = "Debug: Disconnect" })
		vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Debug: Toggle UI" })
		vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Debug: Restart" })
		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>dB", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "Debug: Set Breakpoint" })

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close
	end,
}
