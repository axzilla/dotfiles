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
			["<leader>x"] = { name = "Trouble" },
			["<leader>s"] = { name = "Session" },
			["<leader>l"] = { name = "LSP" },
			["<leader>g"] = { name = "Git" },
			["<leader>f"] = { name = "Find/Telescope" },
			["<leader>e"] = { name = "Explorer/Files" },
		})
	end,
}
