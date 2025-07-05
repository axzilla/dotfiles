return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      -- vim.cmd("colorscheme gruvbox")
    end,
    opts = {}
  },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        theme = "dragon",
        transparent = false,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
      })
      vim.cmd("colorscheme kanagawa-dragon")
    end,
  },
}
