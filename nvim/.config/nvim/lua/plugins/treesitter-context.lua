local treesitter_context_active = true

local function toggle_treesitter_context()
	if treesitter_context_active then
		require("treesitter-context").disable()
	else
		require("treesitter-context").enable()
	end
	treesitter_context_active = not treesitter_context_active
end

return {
	"nvim-treesitter/nvim-treesitter-context",
	config = function()
		local ts_context = require("treesitter-context")
		ts_context.setup({})

		vim.keymap.set(
			"n",
			"<leader>tc",
			toggle_treesitter_context,
			{ noremap = true, silent = true, desc = "Toggle Treesitter Context" }
		)
	end,
}
