return {
  "vague2k/huez.nvim",
  enabled = true,
  -- if you want registry related features, uncomment this
  import = "huez-manager.import",
  branch = "stable",
  event = "UIEnter",
  config = function()
    require("huez").setup()

    local pickers = require("huez.pickers")
    vim.keymap.set("n", "<leader>tt", pickers.themes, { desc = "Color Themes" })
    vim.keymap.set("n", "<leader>tf", pickers.favorites, { desc = "Favorite Themes" })
    vim.keymap.set("n", "<leader>tl", pickers.live, { desc = "Live Themes" })
    vim.keymap.set("n", "<leader>te", pickers.ensured, { desc = "Ensured Themes" })
  end,
}
