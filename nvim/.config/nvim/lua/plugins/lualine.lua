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

-- local function lsp_client_names()
-- 	local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
-- 	if #buf_clients == 0 then
-- 		return "No LSP"
-- 	end
--
-- 	local client_names = {}
-- 	for _, client in ipairs(buf_clients) do
-- 		table.insert(client_names, client.name)
-- 	end
--
-- 	return table.concat(client_names, ", ")
-- end

return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
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
					-- { "filename", path = 1 }, -- 0 = Filename, 1 = Relative path, 2 = Absolute path
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
					-- { lsp_client_names, icon = icons.misc.LSP },
					"filetype",
				},
			},
		})
	end,
}
