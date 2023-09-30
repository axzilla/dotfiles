return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'tiagovla/scope.nvim'     -- optional // buffers per tab scoped
  },
  config = function()
    require("bufferline").setup({
      options = {
        show_buffer_close_icons = false,
        offsets = {
          {
            filetype = "neo-tree",
            -- text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        }
      }
    })
    require("scope").setup({})
  end
}
