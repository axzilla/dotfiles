return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local oil = require("oil")
		oil.setup({
			view_options = {
				show_hidden = true,
			},
			-- Linux: `~/.local/share/Trash/`
			-- macOS: `~/.Trash/`
			-- Windows: Recycle Bin
			delete_to_trash = true,
		})
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open Oil" })
	end,
}
