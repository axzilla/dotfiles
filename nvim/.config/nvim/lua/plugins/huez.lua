return {
	"axzilla/huez.nvim",
	branch = "feature/current-colorscheme-preselect",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"stevearc/dressing.nvim",
	},
	config = function()
		require("huez").setup({
			omit = {
				"default",
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
			},
		})
		local colorscheme = require("huez.api").get_colorscheme()
		vim.cmd("colorscheme " .. colorscheme)

		vim.keymap.set("n", "<leader>fC", "<cmd>Huez<CR>", { desc = "Find Colorscheme" })
	end,
}
