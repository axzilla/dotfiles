return {
	enabled = true,
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		local toggleterm = require("toggleterm")

		toggleterm.setup({
			open_mapping = [[<c-\>]],
			direction = "float",
			shade_terminals = true,
		})
	end,
}
