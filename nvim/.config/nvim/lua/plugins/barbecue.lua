return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic", -- required
		"nvim-tree/nvim-web-devicons", -- optional
	},
	config = function()
		local barbecue = require("barbecue")
		local barbecue_ui = require("barbecue.ui")

		barbecue.setup({
			attach_navic = false,
			symbols = {
				separator = ">",
			},
		})

		local barbecue_enabled = true
		local function toggle_barbecue()
			barbecue_ui.toggle()
			barbecue_enabled = not barbecue_enabled
			vim.notify("Barbecue " .. (barbecue_enabled and "enabled" or "disabled"))
		end

		vim.keymap.set("n", "<leader>ub", toggle_barbecue, { desc = "Toggle Barbecue" })
	end,
}
