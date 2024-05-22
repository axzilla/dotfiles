return {
	"nvim-treesitter/nvim-treesitter-context",
	config = function()
		local ts_context = require("treesitter-context")
		ts_context.setup()

		local context_enabled = true
		local function toggle_treesitter_context()
			ts_context.toggle()
			context_enabled = not context_enabled
			vim.notify("Treesitter Context " .. (context_enabled and "enabled" or "disabled"))
		end

		vim.keymap.set(
			"n",
			"<leader>uc",
			toggle_treesitter_context,
			{ noremap = true, silent = true, desc = "Toggle Treesitter Context" }
		)
	end,
}
