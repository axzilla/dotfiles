return {
  cond = true,
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require("neo-tree").setup({
      window = {
        mappings = {
          ["<space>"] = "none", -- disable space for neo-tree "toggle_node" and use space as normal leader key
        },
        width = 30,
      },
      filesystem = {
        follow_current_file = { enabled = true },
      },
    })
    vim.keymap.set('n', '<Leader>e', '<Cmd>Neotree toggle<CR>', { desc = 'Toggle Neotree' })
    vim.keymap.set('n', '<Leader>o', function()
      if vim.bo.filetype == "neo-tree" then
        vim.cmd.wincmd("p")
      else
        vim.cmd("Neotree focus")
      end
    end, { desc = "Toggle Neotree Focus" })
  end
}
