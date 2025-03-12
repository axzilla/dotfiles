return {
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				transparent = false,
				undercurl = true, -- Enable undercurls
				commentStyle = { italic = true },
				functionStyle = { bold = true },
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = { italic = true },
				dimInactive = false, -- Dim inactive windows
				terminalColors = true, -- Terminal colors
				overrides = {}, -- Custom overrides
				background = { -- Map the value to the Lush palette color or directly override them
					dark = "wave",
					light = "lotus",
				},
				theme = "wave", -- Specify theme (default = "wave", options: "wave", "dragon", "lotus")
				compile = false, -- Enable or disable compiling the colorscheme
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
	{ "ellisonleao/gruvbox.nvim" },
}
