return {
  -- "catppuccin/nvim",
  -- name = "catppuccin",
  -- priority = 1000,
  -- config = function()
  --   require("catppuccin").setup({
  --     color_overrides = {
  --       mocha = {
  --         base = "#262626",
  --         mantle = "#000000",
  --         crust = "#000000",
  --       },
  --     },
  --   })
  --
  --   vim.cmd.colorscheme "catppuccin"
  -- end
  "rebelot/kanagawa.nvim",
  config = function()
    -- vim.cmd("colorscheme kanagawa-wave")
    vim.cmd("colorscheme kanagawa-dragon")
    -- vim.cmd("colorscheme kanagawa-lotus")
  end
}
