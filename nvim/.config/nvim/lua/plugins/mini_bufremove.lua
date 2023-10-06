-- because :bd/:bdelete doesn't work with bufferline without bugs!
return {
  cond = false,
  'echasnovski/mini.bufremove',
  version = '*',
  config = function()
    require('mini.bufremove').setup()
    vim.keymap.set('n', '<leader>bd', function() require("mini.bufremove").delete(0, false) end,
      { desc = "Delete Buffer" })
    vim.keymap.set('n', '<leader>bD', function() require("mini.bufremove").delete(0, true) end,
      { desc = "Delete Buffer (Force)" })
  end
}
