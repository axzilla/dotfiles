-- In der Datei plugins/dap/_go.lua

local M = {}

M.setup = function()
	local dap = require("dap")
	require("dap-go").setup()

	dap.configurations.go = {
		{
			type = "go",
			name = "Debug Go Server with Templ and Air",
			request = "launch",
			program = "${workspaceFolder}/cmd/server",
			args = { "serve", "--dir", "./pb_data" },
			cwd = "${workspaceFolder}",
		},
	}
end

return M
