return {
	"folke/which-key.nvim",
	config = function()
		local wk = require("which-key")
		wk.register({
			["<leader>d"] = { name = "Debugger" },
			["<leader>l"] = { name = "LSP" },
			["<leader>g"] = { name = "Git" },
			["<leader>f"] = { name = "Find/Telescope" },
		})
	end,
}
