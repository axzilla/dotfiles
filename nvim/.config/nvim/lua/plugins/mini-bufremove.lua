-- because :bd/:bdelete doesn't work with bufferline without bugs!
return {
  'echasnovski/mini.bufremove',
  config = function()
    require('mini.bufremove').setup()
    vim.keymap.set('n', '<leader>c', function() require("mini.bufremove").delete(0, false) end,
      { desc = "Delete Buffer" })
    vim.keymap.set('n', '<leader>C', function() require("mini.bufremove").delete(0, true) end,
      { desc = "Delete Buffer (Force)" })
  end
}
