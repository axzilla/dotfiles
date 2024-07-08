return {
	"vague2k/huez.nvim",
	-- if you want registry related features, uncomment this
	import = "huez-manager.import",
	branch = "stable",
	event = "UIEnter",
	config = function()
		require("huez").setup({
			exclude = {
				"desert",
				"base16",
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

		vim.keymap.set("n", "<leader>tt", ":Huez<CR>", { desc = "Color Themes" })
		vim.keymap.set("n", "<leader>tf", ":HuezFavorites<CR>", { desc = "Favorite Themes" })
		vim.keymap.set("n", "<leader>tl", ":HuezLive<CR>", { desc = "Live Themes" })
		vim.keymap.set("n", "<leader>te", ":HuezEnsured<CR>", { desc = "Ensured Themes" })
	end,
}
