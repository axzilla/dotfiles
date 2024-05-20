local icons = require("config.icons").icons

local function recording_indicator()
	local recording = vim.fn.reg_recording()
	if recording ~= "" then
		return icons.misc.LSP .. "@" .. recording --
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

return {
	"nvim-lualine/lualine.nvim",
	config = function()
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
					{
						"mode",
						fmt = function(str)
							return str:sub(1, 1)
						end,
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
					{ get_current_folder_name, icon = icons.misc.Folder },
					{ custom_filename },
					{ recording_indicator },
				},
				lualine_x = {
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
	end,
}
