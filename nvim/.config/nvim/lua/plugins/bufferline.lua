return {
	enabled = true,
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"tiagovla/scope.nvim", -- optional // buffers per tab scoped
	},
	config = function()
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

		vim.opt.showtabline = 0

		local function toggle_bufferline()
			local current_value = vim.opt.showtabline:get()
			local new_value = current_value == 0 and 2 or 0
			vim.opt.showtabline = new_value
			vim.notify("Tabline " .. (new_value == 2 and "enabled" or "disabled"))
		end

		vim.keymap.set("n", "<Leader>ut", toggle_bufferline, { desc = "Toggle Tabline" })
	end,
}
