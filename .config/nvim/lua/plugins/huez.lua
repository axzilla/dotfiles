-- ---@diagnostic disable: missing-fields
-- return {
-- 	"vague2k/huez.nvim",
-- 	dependencies = {
-- 		"nvim-telescope/telescope.nvim",
-- 		"stevearc/dressing.nvim",
-- 	},
-- 	config = function()
-- 		local huez = require("huez")
--
-- 		huez.setup({
-- 			omit = {
-- 				-- v9.x
-- 				"default",
-- 				"desert",
-- 				"evening",
-- 				"industry",
-- 				"koehler",
-- 				"morning",
-- 				"murphy",
-- 				"pablo",
-- 				"peachpuff",
-- 				"ron",
-- 				"shine",
-- 				"slate",
-- 				"torte",
-- 				"zellner",
-- 				"blue",
-- 				"darkblue",
-- 				"delek",
-- 				"quiet",
-- 				"elflord",
-- 				"habamax",
-- 				"lunaperche",
-- 				-- v10.x
-- 				"retrobox",
-- 				"sorbet",
-- 				"vim",
-- 				"wildcharm",
-- 				"zaibatsu",
-- 			},
-- 		})
--
-- 		local colorscheme = require("huez.api").get_colorscheme()
-- 		vim.cmd("colorscheme " .. colorscheme)
--
-- 		vim.keymap.set("n", "<leader>fC", "<cmd>Huez<CR>", { desc = "Find Colorscheme" })
-- 	end,
-- }

return {
	"vague2k/huez.nvim",
	-- if you want registry related features, uncomment this
	-- import = "huez-manager.import"
	config = function()
		require("huez").setup({})

		local pickers = require("huez.pickers")

		vim.keymap.set("n", "<leader>tt", pickers.themes, { desc = "Color Themes" })
		vim.keymap.set("n", "<leader>tf", pickers.favorites, { desc = "Favorite Themes" })
		vim.keymap.set("n", "<leader>tl", pickers.live, { desc = "Live Themes" })
		vim.keymap.set("n", "<leader>te", pickers.ensured, { desc = "Ensured Themes" })
	end,
}
