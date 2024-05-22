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

		local function custom_filename()
			if vim.bo.filetype == "neo-tree" or vim.bo.filetype == "NvimTree" then
				return "Neotree"
			end

			local name = vim.fn.bufname()
			if name == "" then
				return ""
			else
				-- Uses fnamemodify to get the relative path to the current file
				return vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")
			end
		end

		local function get_theme_colors()
			local function get_color(name, attr)
				local hl = vim.api.nvim_get_hl_by_name(name, true)
				return hl[attr] and string.format("#%06x", hl[attr]) or nil
			end

			return {
				normal_fg = get_color("Normal", "foreground"),
				statusline_fg = get_color("StatusLine", "foreground"),
				statusline_nc_fg = get_color("StatusLineNC", "foreground"),
				folder_fg = get_color("Directory", "foreground"),
				filename_fg = get_color("Title", "foreground"),
				macro_fg = get_color("Macro", "foreground"),
			}
		end

		local function setup_lualine()
			local lualine = require("lualine")
			local colors = get_theme_colors()

			local custom_theme = {
				normal = {
					a = { bg = "none", fg = colors.normal_fg or "#ffffff" },
					b = { bg = "none", fg = colors.statusline_fg or "#ffffff" },
					c = { bg = "none", fg = colors.statusline_fg or "#ffffff" },
				},
				insert = {
					a = { bg = "none", fg = colors.statusline_fg or "#ffffff" },
					b = { bg = "none", fg = colors.statusline_fg or "#ffffff" },
					c = { bg = "none", fg = colors.statusline_fg or "#ffffff" },
				},
				visual = {
					a = { bg = "none", fg = colors.statusline_fg or "#ffffff" },
					b = { bg = "none", fg = colors.statusline_fg or "#ffffff" },
					c = { bg = "none", fg = colors.statusline_fg or "#ffffff" },
				},
				replace = {
					a = { bg = "none", fg = colors.statusline_fg or "#ffffff" },
					b = { bg = "none", fg = colors.statusline_fg or "#ffffff" },
					c = { bg = "none", fg = colors.statusline_fg or "#ffffff" },
				},
				command = {
					a = { bg = "none", fg = colors.statusline_fg or "#ffffff" },
					b = { bg = "none", fg = colors.statusline_fg or "#ffffff" },
					c = { bg = "none", fg = colors.statusline_fg or "#ffffff" },
				},
				inactive = {
					a = { bg = "none", fg = colors.statusline_nc_fg or "#aaaaaa" },
					b = { bg = "none", fg = colors.statusline_nc_fg or "#aaaaaa" },
					c = { bg = "none", fg = colors.statusline_nc_fg or "#aaaaaa" },
				},
			}

			lualine.setup({
				options = {
					theme = custom_theme,
					globalstatus = true,
					section_separators = "",
					component_separators = "",
					disabled_filetypes = { statusline = { "alpha" } },
				},
				sections = {
					lualine_a = {
						{
							"mode",
							fmt = function(str)
								return str:sub(1, 1)
							end,
							color = { fg = colors.normal_fg or "#ffffff" },
						},
					},
					lualine_b = {
						"branch",
						{
							"diff",
							symbols = {
								added = icons.git.Added,
								modified = icons.git.Modified,
								removed = icons.git.Removed,
							},
						},
					},
					lualine_c = {
						{
							get_current_folder_name,
							icon = icons.misc.Folder,
							color = { fg = colors.folder_fg or "#00ffff" },
						},
						{ custom_filename, color = { fg = colors.filename_fg or "#ffffff" } },
					},
					lualine_x = {
						{ recording_indicator, color = { fg = colors.macro_fg or "#ff9900" } },
						{
							"diagnostics",
							symbols = {
								error = icons.diagnostics.Error,
								warn = icons.diagnostics.Warn,
								hint = icons.diagnostics.Hint,
								info = icons.diagnostics.Info,
							},
						},
						"filetype",
					},
				},
			})
		end

		setup_lualine()

		-- vim.api.nvim_create_autocmd("ColorScheme", {
		-- 	pattern = "*",
		-- 	callback = setup_lualine,
		-- })

		local function toggle_lualine()
			if vim.o.laststatus == 0 then
				vim.o.laststatus = 2
				setup_lualine()
				vim.notify("Lualine enabled")
			else
				vim.o.laststatus = 0
				vim.notify("Lualine disabled")
			end
		end

		vim.keymap.set("n", "<leader>ul", toggle_lualine, { noremap = true, silent = true, desc = "Toggle Lualine" })
	end,
}
