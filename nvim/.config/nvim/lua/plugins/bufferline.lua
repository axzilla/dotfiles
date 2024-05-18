return {
	enabled = false,
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"tiagovla/scope.nvim", -- optional // buffers per tab scoped
	},
	config = function()
		require("bufferline").setup({
			options = {
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

		local function toggle_tabline()
			local current_value = vim.opt.showtabline:get()
			local new_value = current_value == 0 and 2 or 0
			vim.opt.showtabline = new_value
		end

		vim.keymap.set("n", "<Leader>tt", function()
			toggle_tabline()
		end, { desc = "Toggle Tabline" })
	end,
}
