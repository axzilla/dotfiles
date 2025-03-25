return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local icons = require("config.icons").icons

		require("lualine").setup({
			options = {
				theme = "auto",
				globalstatus = true,
				component_separators = "",
				section_separators = "",
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							return str:sub(1, 1)
						end,
					},
				},
				lualine_b = {},
				lualine_c = {
					"branch",
					{
						function()
							return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
						end,
						icon = icons.misc.Folder,
					},
					{
						"filename",
						icon = icons.misc.File,
					},
					{
						"diagnostics",
						symbols = {
							warn = icons.misc.Flame,
							error = icons.misc.Flame,
							hint = icons.misc.Flame,
							info = icons.misc.Flame,
						},
						colored = true,
					},
				},
				lualine_x = {
					{
						function()
							local recording_reg = vim.fn.reg_recording()
							if recording_reg ~= "" then
								return icons.misc.Macro
							end
							return ""
						end,
					},
					"progress",
				},
				lualine_y = {},
				lualine_z = {
					"location",
				},
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
