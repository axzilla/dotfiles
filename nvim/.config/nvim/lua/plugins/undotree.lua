return {
	"mbbill/undotree",
	config = function()
		vim.keymap.set("n", "<leader>U", vim.cmd.UndotreeToggle, { desc = "Toogle Undotree" })
		vim.g.undotree_SetFocusWhenToggle = 1
	end,
}
