return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"astro",
				"c",
				"cpp",
				"go",
				"lua",
				"python",
				"rust",
				"tsx",
				"typescript",
				"vimdoc",
				"vim",
				"html",
				"svelte",
			},
			highlight = { enable = true },
		})
	end,
}
