return {
	"nvim-treesitter/nvim-treesitter-context",
	config = function()
		local zen_mode = require("config.zen_mode")
		local ts_context = require("treesitter-context")
		ts_context.setup({})

		vim.keymap.set(
			"n",
			"<leader>uc",
			zen_mode.toggle_treesitter_context,
			{ noremap = true, silent = true, desc = "Toggle Treesitter Context" }
		)
	end,
}
