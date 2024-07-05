return {
	"vague2k/huez.nvim",
	-- if you want registry related features, uncomment this
	-- import = "huez-manager.import"
	config = function()
		require("huez").setup({
			exclude = {
				"desert",
				"evening",
				"industry",
				"koehler",
				"morning",
				"murphy",
				"pablo",
				"peachpuff",
				"ron",
				"shine",
				"slate",
				"torte",
				"zellner",
				"blue",
				"darkblue",
				"delek",
				"quiet",
				"elflord",
				"habamax",
				"lunaperche",
				"zaibatsu",
				"wildcharm",
				"sorbet",
				"vim",
				"default",
				"retrobox",
			},
		})

		local pickers = require("huez.pickers")

		vim.keymap.set("n", "<leader>tt", pickers.themes, { desc = "Color Themes" })
		vim.keymap.set("n", "<leader>tf", pickers.favorites, { desc = "Favorite Themes" })
		vim.keymap.set("n", "<leader>tl", pickers.live, { desc = "Live Themes" })
		vim.keymap.set("n", "<leader>te", pickers.ensured, { desc = "Ensured Themes" })
	end,
}
