return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local icons = require("config.icons").icons
		local lualine = require("lualine")

		lualine.setup({
			options = {
				globalstatus = true,
				section_separators = "",
				component_separators = "",
			},
			sections = {
				lualine_a = {
					{ "mode" },
				},
				lualine_b = {},
				lualine_c = {
					{ "branch" },
					{
						"diff",
						symbols = {
							added = icons.misc.Dot,
							modified = icons.misc.Dot,
							removed = icons.misc.Dot,
						},
					},
					{
						-- Workspace root folder name
						function()
							return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
						end,
					},
				},
				lualine_x = {
					{
						"diagnostics",
						symbols = {
							error = icons.misc.Flame,
							warn = icons.misc.Flame,
							hint = icons.misc.Flame,
							info = icons.misc.Flame,
						},
					},
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})

		local function toggle_lualine()
			if vim.o.laststatus == 1 then
				vim.o.laststatus = 3
				vim.notify("Lualine enabled")
			else
				vim.o.laststatus = 1
				vim.notify("Lualine disabled")
			end
		end

		vim.keymap.set("n", "<leader>ul", toggle_lualine, { noremap = true, silent = true, desc = "Toggle Lualine" })
	end,
}
