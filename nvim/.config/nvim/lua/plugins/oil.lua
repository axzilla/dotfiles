return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			view_options = {
				show_hidden = true,
			},
			delete_to_trash = true,
		})
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open Oil (Buffer)" })
		vim.keymap.set("n", "eo", "<CMD>Oil<CR>", { desc = "Open Oil (Buffer)" })
	end,
}
