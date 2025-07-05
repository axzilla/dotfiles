return {
  {
    "zbirenbaum/copilot.lua",
    enabled = true,
    cmd = "Copilot",
    event = "InsertEnter",
    keys = {
      {
        "<leader>ua",
        function()
          local copilot_client = require("copilot.client")
          local copilot_command = require("copilot.command")

          if copilot_client.is_disabled() then
            copilot_command.enable()
            vim.notify("Copilot ON")
          else
            copilot_command.disable()
            vim.notify("Copilot OFF")
          end
        end,
        desc = "Toggle Copilot",
      },
    },
    config = function()
      local copilot = require("copilot")

      copilot.setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          kemap = {
            accept = "<M-y>",
            accept_word = "<M-w>",
            accept_line = "<M-l>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        panel = { enabled = false },
      })

      -- Disable Copilot on startup
      vim.defer_fn(function()
        require("copilot.command").disable()
      end, 100)
    end,
  },
}
