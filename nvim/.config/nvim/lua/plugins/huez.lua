return {
	"vague2k/huez.nvim",
	-- if you want registry related features, uncomment this
	import = "huez-manager.import",
	branch = "stable",
	event = "UIEnter",
	config = function()
		require("huez").setup({
			exclude = {
				-- exclude every neovim standard colorschemes
				"blue",
				"darkblue",
				"default",
				"delek",
				"desert",
				"elflord",
				"evening",
				"habamax",
				"industry",
				"koehler",
				"lunaperche",
				"morning",
				"murphy",
				"pablo",
				"peachpuff",
				"quiet",
				"retrobox",
				"ron",
				"shine",
				"slate",
				"sorbet",
				"torte",
				"vim",
				"wildcharm",
				"zaibatsu",
				"zellner",
				"zenburn",
				"default16",
				"default88",
				"default256",
			},
		})

		local pickers = require("huez.pickers")
		vim.keymap.set("n", "<leader>tt", pickers.themes, { desc = "Color Themes" })
		vim.keymap.set("n", "<leader>tf", pickers.favorites, { desc = "Favorite Themes" })
		vim.keymap.set("n", "<leader>tl", pickers.live, { desc = "Live Themes" })
		vim.keymap.set("n", "<leader>te", pickers.ensured, { desc = "Ensured Themes" })
	end,
}
