return {
	"echasnovski/mini.files",
	config = function()
		require("mini.files").setup({
			windows = {
				-- preview = true,
			},
		})
		vim.keymap.set(
			"n",
			"<Leader>em",
			"<Cmd>:lua MiniFiles.open(vim.fn.expand('%:p'),false )<CR>",
			{ desc = "Open MiniFiles (Buffer)" }
		)

		vim.keymap.set(
			"n",
			"<Leader>eM",
			"<Cmd>:lua MiniFiles.open(vim.fn.getcwd(),false )<CR>",
			{ desc = "Open MiniFiles (cwd)" }
		)
	end,
}
