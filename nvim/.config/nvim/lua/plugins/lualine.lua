return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup({
      options = {
        globalstatus = true,
        section_separators = '',
        component_separators = ''
      },
      sections = {
        lualine_c = {
          {
            'filename',
            path = 1
          }
        }
      }
    })
  end
}
