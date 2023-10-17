return {
  "rebelot/kanagawa.nvim",
  config = function()
    vim.cmd("colorscheme kanagawa-dragon")
    -- vim.cmd("colorscheme kanagawa-wave")
    -- vim.cmd("colorscheme kanagawa-lotus")
  end
}

-- return {
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
-- }

-- return {
--   "nyoom-engineering/oxocarbon.nvim",
--   config = function()
--     vim.opt.background = "dark" -- set this to dark or light
--     vim.cmd.colorscheme "oxocarbon"
--   end
-- }
