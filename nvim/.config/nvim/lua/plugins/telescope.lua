return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons'
    },
    config = function()
        local builtin = require('telescope.builtin')

        -- builtins
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find help' })
        vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Find word' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Find grep' })
        vim.keymap.set('n', '<leader>fG', builtin.git_files, { desc = 'Find git' })
        vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Find diagnostics' })
        vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'Find oldfiles' })
        vim.keymap.set('n', '<leader>fj', builtin.jumplist, { desc = 'Find jumplist' })

        -- plugins
        vim.keymap.set('n', '<leader>fn', '<cmd>NoiceTelescope<cr>', { desc = 'Find Noice' })
    end
}
