return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {},
	config = function()
		local wk = require("which-key")
		wk.register({
			["<leader>d"] = { name = "Debugger" },
			["<leader>s"] = { name = "Session" },
			["<leader>l"] = { name = "LSP" },
			["<leader>g"] = { name = "Git" },
			["<leader>f"] = { name = "Find/Telescope" },
		})
	end,
}
