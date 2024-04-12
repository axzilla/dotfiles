return {
	"numToStr/Comment.nvim",
	lazy = false,
	config = function()
		require("Comment").setup()
		vim.keymap.set("n", "<Leader>/", function()
			require("Comment.api").toggle.linewise.count(vim.v.count1)
		end, { desc = "Toggle comment line" })
		vim.keymap.set(
			"v",
			"<Leader>/",
			"<Esc><Cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
			{ desc = "Toggle comment for selection" }
		)
	end,
}
