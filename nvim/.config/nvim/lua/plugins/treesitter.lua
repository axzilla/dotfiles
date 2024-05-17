return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				-- markdown_inline because of a error with trouble v3(beta)
				"markdown_inline",
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
				"vimdoc",
				"vim",
				"html",
				"svelte",
				"templ",
			},
			highlight = { enable = true },
		})
	end,
}
