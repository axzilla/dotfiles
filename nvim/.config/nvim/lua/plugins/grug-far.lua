return {
	"MagicDuck/grug-far.nvim",
	opts = {
		headerMaxWidth = 80,
		-- Open on the left by default
		windowCreationCommand = "vsplit",
		-- But open files/results on the right
		openTargetWindow = {
			exclude = {}, -- Keep your existing exclusions
			preferredLocation = "right", -- Change from 'left' to 'right'
		},
	},
	cmd = "GrugFar",
	keys = {
		{
			"<leader>sr",
			function()
				local grug = require("grug-far")
				local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
				grug.open({
					transient = true,
					prefills = {
						filesFilter = ext and ext ~= "" and "*." .. ext or nil,
					},
				})
			end,
			mode = { "n", "v" },
			desc = "Search and Replace",
		},
	},
}
