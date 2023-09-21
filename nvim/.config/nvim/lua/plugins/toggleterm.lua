return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            require('toggleterm').setup({
                open_mapping = '<leader>t',
                direction = 'float',
                shade_terminals = true
            })
        end
    }
}
