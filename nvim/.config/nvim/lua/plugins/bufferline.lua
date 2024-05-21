return {
	enabled = true,
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"tiagovla/scope.nvim", -- optional // buffers per tab scoped
	},
	config = function()
		local zen_mode = require("config.zen_mode")
		local bufferline = require("bufferline")

		bufferline.setup({
			options = {
				show_buffer_close_icons = false,
				show_close_icon = false,
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		})

		require("scope").setup({})

		vim.keymap.set("n", "<Leader>ut", zen_mode.toggle_bufferline, { desc = "Toggle Tabline" })
	end,
}
