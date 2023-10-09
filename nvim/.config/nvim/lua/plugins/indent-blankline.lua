-- return {
--   'lukas-reineke/indent-blankline.nvim',
--   config = function()
--     require('indent_blankline').setup {
--       show_current_context = true
--     }
--   end
-- }

return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
  config = function()
    require("ibl").setup()
  end
}
