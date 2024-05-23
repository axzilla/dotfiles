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
			["<leader>b"] = { name = "Buffers" },
			["<leader>x"] = { name = "Trouble" },
			["<leader>s"] = { name = "Search" },
			["<leader>l"] = { name = "LSP" },
			["<leader>g"] = { name = "Git" },
			["<leader>gg"] = { name = "Gitsigns" },
			["<leader>gd"] = { name = "Diffview" },
			["<leader>f"] = { name = "Find/Telescope" },
			["<leader>e"] = { name = "Explorer/Files" },
			["<leader>u"] = { name = "UI" },
		})
	end,
}
