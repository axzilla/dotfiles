return {
	"christoomey/vim-tmux-navigator",
	vim.keymap.set("n", "C-h", ":TmuxNavigateLeft<cr>", { desc = "Move to left window" }),
	vim.keymap.set("n", "C-j", ":TmuxNavigteDown<cr>", { desc = "Move to below window" }),
	vim.keymap.set("n", "C-k", ":TmuxNavigateUp<cr>", { desc = "Move to above window" }),
	vim.keymap.set("n", "C-l", ":TmuxNavigateRight<cr>", { desc = "Move to right window" })
}
