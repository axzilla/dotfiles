---@diagnostic disable: missing-fields
return {
	"vague2k/huez.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"stevearc/dressing.nvim",
	},
	config = function()
		-- TODO: Doesn't open at current colorscheme
		local huez = require("huez")

		huez.setup({
			omit = {
				-- v9.x
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
				-- v10.x
				"retrobox",
				"sorbet",
				"vim",
				"wildcharm",
				"zaibatsu",
			},
		})

		local colorscheme = require("huez.api").get_colorscheme()
		vim.cmd("colorscheme " .. colorscheme)

		vim.keymap.set("n", "<leader>fC", "<cmd>Huez<CR>", { desc = "Find Colorscheme" })
	end,
}
