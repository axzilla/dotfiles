return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local icons = require("config.icons").icons

		local function recording_indicator()
			local recording = vim.fn.reg_recording()
			if recording ~= "" then
				return icons.misc.Macro .. "@" .. recording
			else
				return ""
			end
		end

		local function get_current_folder_name()
			local path = vim.fn.getcwd() -- Get the current working directory
			return path:match("([^/\\]+)$") -- Extracts only the last segment of the path (the current folder name)
		end

		local function setup_lualine()
			local lualine = require("lualine")

			lualine.setup({
				options = {
					globalstatus = true,
					section_separators = "",
					component_separators = "",
					disabled_filetypes = { statusline = { "alpha" } },
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
							get_current_folder_name,
							icon = icons.misc.Folder,
						},
					},
					lualine_x = {
						{ recording_indicator },
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
		end

		setup_lualine()

		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = setup_lualine,
		})

		local function toggle_lualine()
			if vim.o.laststatus == 1 then
				vim.o.laststatus = 3
				setup_lualine()
				vim.notify("Lualine enabled")
			else
				vim.o.laststatus = 1
				vim.notify("Lualine disabled")
			end
		end

		vim.keymap.set("n", "<leader>ul", toggle_lualine, { noremap = true, silent = true, desc = "Toggle Lualine" })
	end,
}
