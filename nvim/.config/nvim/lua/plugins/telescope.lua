return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    require('telescope').setup({
      defaults = {
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = { prompt_position = "top", preview_width = 0.55 },
          -- vertical = { mirror = false },
          width = 0.90,
          height = 0.80,
          -- preview_cutoff = 120,
        },
      },
    })
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find Buffers' })
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find Help' })
    vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Find Word' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Find Grep' })
    vim.keymap.set('n', '<leader>fG', builtin.git_files, { desc = 'Find Git Files' })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Find Diagnostics' })
    vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'Find Oldfiles' })
    vim.keymap.set('n', '<leader>fj', builtin.jumplist, { desc = 'Find Jumplist' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Find Keymaps' })
  end
}
