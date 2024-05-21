local icons = require("config.icons").icons

local function recording_indicator()
	local recording = vim.fn.reg_recording()
	if recording ~= "" then
		return icons.misc.Macro .. "@" .. recording --
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

local lualine_active = true
local function toggle_lualine()
	if lualine_active then
		---@diagnostic disable-next-line: missing-parameter
		require("lualine").hide()
		vim.o.laststatus = 0
	else
		require("lualine").setup({})
	end
	lualine_active = not lualine_active
end

return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local lualine = require("lualine")

		local custom_theme = {
			normal = {
				a = { bg = "none" },
				b = { bg = "none" },
				c = { bg = "none" },
			},
			insert = {
				a = { bg = "none" },
				b = { bg = "none" },
				c = { bg = "none" },
			},
			visual = {
				a = { bg = "none" },
				b = { bg = "none" },
				c = { bg = "none" },
			},
			replace = {
				a = { bg = "none" },
				b = { bg = "none" },
				c = { bg = "none" },
			},
			command = {
				a = { bg = "none" },
				b = { bg = "none" },
				c = { bg = "none" },
			},
			inactive = {
				a = { bg = "none" },
				b = { bg = "none" },
				c = { bg = "none" },
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
					},
				},
				lualine_b = {
					"branch",
					-- {
					-- 	"diff",
					-- 	symbols = {
					-- 		added = icons.git.Added,
					-- 		modified = icons.git.Modified,
					-- 		removed = icons.git.Removed,
					-- 	},
					-- },
				},
				lualine_c = {
					{ get_current_folder_name, icon = icons.misc.Folder },
					{ custom_filename },
				},
				lualine_x = {
					{ recording_indicator },
					-- {
					-- 	"diagnostics",
					-- 	symbols = {
					-- 		error = icons.diagnostics.Error,
					-- 		warn = icons.diagnostics.Warn,
					-- 		hint = icons.diagnostics.Hint,
					-- 		info = icons.diagnostics.Info,
					-- 	},
					-- },
					-- "filetype",
				},
			},
		})

		vim.keymap.set("n", "<leader>tl", toggle_lualine, { noremap = true, silent = true, desc = "Toggle Lualine" })
	end,
}
