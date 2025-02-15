---@diagnostic disable: missing-fields
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local ts_configs = require("nvim-treesitter.configs")

		ts_configs.setup({
			ensure_installed = {
				-- markdown_inline because of a error with trouble v3(beta)
				"markdown_inline",
				"markdown",
				"c",
				"cpp",
				"go",
				"gomod",
				"gosum",
				"gotmpl",
				"lua",
				"python",
				"rust",
				"tsx",
				"typescript",
				"javascript",
				"vimdoc",
				"vim",
				"html",
				"svelte",
				"templ",
				"css",
			},
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		})
	end,
}
