local M = {}
M.setup = function()
	local dap = require("dap")
	require("dap-go").setup()

	-- Super minimal per project setup. Will be overwritten by .vscode/launch.json since it detects it automatically
	dap.configurations.go = {
		{
			type = "go",
			name = "Debug Current File",
			request = "launch",
			program = "${file}",
		},
	}
end
return M
