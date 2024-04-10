return {
  'rmagatti/auto-session',
  config = function()
    require("auto-session").setup({
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      pre_save_cmds = { "Neotree close" },
      vim.keymap.set("n", "<leader>fs", require("auto-session.session-lens").search_session, {
        desc = "Find Session", noremap = true,
      })
    })
  end
}
