return {
	{ "kepano/flexoki-neovim", name = "flexoki" },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000, -- Ensure it loads first
	},
	{ "projekt0n/caret.nvim" },
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
			})
		end,
	},
	{ "nyoom-engineering/oxocarbon.nvim" },
	{ "projekt0n/github-nvim-theme" },
	{ "maxmx03/fluoromachine.nvim" },
	{ "Mofiqul/dracula.nvim" },
	{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
	{
		"ribru17/bamboo.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("bamboo").setup()
			require("bamboo").load()
		end,
	},
	{
		"scottmckendry/cyberdream.nvim",
		opts = {
			transparent = true,
			italic_comments = true,
			hide_fillchars = true,
			borderless_telescope = true,
			terminal_colors = true,
		},
	},
	{
		"craftzdog/solarized-osaka.nvim",
		priority = 1000,
		-- lazy = true,
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
}
