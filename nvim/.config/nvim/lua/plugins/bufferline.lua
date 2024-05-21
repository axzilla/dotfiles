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

		-- vim.opt.showtabline = 0 -- Hide tabline

		local function toggle_tabline()
			---@diagnostic disable-next-line: undefined-field
			local current_value = vim.opt.showtabline:get()
			local new_value = current_value == 0 and 2 or 0
			vim.opt.showtabline = new_value
		end

		vim.keymap.set("n", "<Leader>tt", function()
			toggle_tabline()
		end, { desc = "Toggle Tabline" })
	end,
}
