return {
	"echasnovski/mini.files",
	config = function()
		require("mini.files").setup({
			windows = {
				preview = true,
			},
		})
		vim.keymap.set("n", "<Leader>E", "<Cmd>:lua MiniFiles.open()<CR>", { desc = "Open MiniFiles" })
	end,
}
