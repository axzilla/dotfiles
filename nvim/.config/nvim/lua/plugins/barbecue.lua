return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic", -- required
		"nvim-tree/nvim-web-devicons", -- optional
	},
	config = function()
		local zen_mode = require("config.zen_mode")
		local barbecue = require("barbecue")

		barbecue.setup({
			symbols = {
				separator = ">",
			},
		})

		vim.keymap.set("n", "<leader>ub", zen_mode.toggle_barbecue, { desc = "Toggle Barbecue" })
	end,
}
