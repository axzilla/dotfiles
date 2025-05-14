return {
  enabled = true,
  "echasnovski/mini.files",
  config = function()
    local mini_files = require("mini.files")
    mini_files.setup({
      mappings = {
        synchronize = "<Leader>w",
      },
      options = {
        -- Linux/Mac: ~/.local/share/nvim/mini.files/trash/
        permanent_delete = false,
      },
    })

    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    map("n", "<leader>m", function()
      require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
    end, { desc = "Open mini.files" })

    map("n", "<leader>M", function()
      require("mini.files").open(vim.loop.cwd(), true)
    end, { desc = "Open mini.files (CWD)" })
  end,
}
