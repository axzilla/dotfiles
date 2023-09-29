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
      ["<leader>u"] = { name = "UI/UX",
        -- f = { "<cmd>IrgendeinBefehl<CR>", "Beschreibung für af" },
        -- a = { "<cmd>EinAndererBefehl<CR>", "Beschreibung für aa" },
      }
    })
  end
}
