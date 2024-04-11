return {
  'folke/which-key.nvim',
  config = function()
    local wk = require("which-key")
    wk.setup({
      icons = {
        -- breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        -- separator = "➜", -- symbol used between a key and it's label
        group = "", -- symbol prepended to a group
      }
    })
    wk.register({
      ["<leader>d"] = { name = "Debugger" },
      ["<leader>l"] = { name = "LSP" },
      ["<leader>g"] = { name = "Git" },
      ["<leader>f"] = { name = "Find/Telescope" }
    })
  end
}
