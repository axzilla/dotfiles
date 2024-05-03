return {
	{ "rebelot/kanagawa.nvim" },
	{ "nyoom-engineering/oxocarbon.nvim" },
	{ "catppuccin/nvim" },
	{ "projekt0n/github-nvim-theme" },
	{ "olimorris/onedarkpro.nvim" },
	{ "sainnhe/sonokai" },
	{ "ellisonleao/gruvbox.nvim" },
	{ "savq/melange-nvim" },
	{ "rose-pine/neovim" },
	{ "sainnhe/everforest" },
	{ "maxmx03/fluoromachine.nvim" },
	{ "EdenEast/nightfox.nvim" },
	{ "navarasu/onedark.nvim" },
	{ "Mofiqul/dracula.nvim" },
	{ "sainnhe/sonokai" },
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
		"gbprod/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nord").setup()
		end,
	},
	{
		"craftzdog/solarized-osaka.nvim",
		priority = 1000,
		lazy = true,
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
}
