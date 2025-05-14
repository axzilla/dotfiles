return {
  "folke/snacks.nvim",
  priority = 1000,
  enabled = true,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile      = { enabled = false },
    dashboard    = { enabled = false },
    explorer     = { enabled = true },
    indent       = { enabled = false },
    input        = { enabled = false },
    picker       = { enabled = false },
    notifier     = { enabled = true },
    notify       = { enabled = true },
    quickfile    = { enabled = false },
    scope        = { enabled = false },
    scroll       = { enabled = false },
    statuscolumn = { enabled = false },
    words        = { enabled = false },
  },
  keys = {
    { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
    { "<leader>e", function() Snacks.explorer() end,             desc = "File Explorer" },
  },
}
