return {
	{
		"zbirenbaum/copilot.lua",
		enabled = false,
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			local copilot = require("copilot")

			copilot.setup({
				suggestion = {
					auto_trigger = true,
					keymap = {
						accept = "<M-y>",
						accept_word = "<M-w>",
						accept_line = "<M-l>",
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
				panel = { enabled = false },
			})
		end,
	},
}
