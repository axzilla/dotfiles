return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup()
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open Oil (Buffer)" })
		vim.keymap.set("n", "eo", "<CMD>Oil<CR>", { desc = "Open Oil (Buffer)" })
	end,
}
