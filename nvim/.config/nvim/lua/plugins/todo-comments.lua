return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    vim.keymap.set('n', '<leader>fc', '<cmd>TodoTelescope<cr>', { desc = 'Find comments' })
  end
}
