return {
	"numToStr/Comment.nvim",
	lazy = false,
	config = function()
		local comment = require("Comment")
		comment.setup()

		vim.keymap.set("n", "<Leader>/", function()
			require("Comment.api").toggle.linewise.count(vim.v.count1)
		end, { desc = "Toggle Comment Line" })

		vim.keymap.set(
			"v",
			"<Leader>/",
			"<Esc><Cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
			{ desc = "Toggle Comment Selection" }
		)
	end,
}
