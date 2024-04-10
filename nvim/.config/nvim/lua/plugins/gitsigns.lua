return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require('gitsigns').setup {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '-' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      }
    }
    vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk, { desc = 'Previous Hunk' })
    vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { desc = 'Next Hunk' })
    vim.keymap.set('n', '<leader>gh', require('gitsigns').preview_hunk, { desc = 'Preview Hunk' })
    vim.keymap.set('n', '<leader>gt', require('gitsigns').toggle_current_line_blame, { desc = 'Toggle Line Blame' })
  end
}
