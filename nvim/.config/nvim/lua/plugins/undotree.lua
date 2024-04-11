return {
  "mbbill/undotree",
  config = function()
    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = "Toogle Undotree" })
    vim.g.undotree_SetFocusWhenToggle = 1
  end
}
