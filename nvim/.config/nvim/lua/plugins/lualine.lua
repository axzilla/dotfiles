return {
    'nvim-lualine/lualine.nvim',
    config = function()
        require('lualine').setup {
            component_separators = '|',
            section_separators = ''
        }
    end
}
