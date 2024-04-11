return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      extensions = {
        file_browser = {
          hidden = true,
          auto_depth = true,
          grouped = true,
          show_hidden = true,
          disable_devicons = false,
          display_stat = false,
          file_ignore_patterns = { ".git", "node_modules", "vendor" },
        },
      },
    })
    require("telescope").load_extension("file_browser")
    -- vim.keymap.set("n", "<space>fB", ":Telescope file_browser<CR>", { desc = "Find Browser" })
    vim.keymap.set("n", "<space>fB", ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
      { desc = "Find Browser" })
  end,
}
