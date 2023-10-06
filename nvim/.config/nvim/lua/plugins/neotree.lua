return {
  cond = false,
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
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
    vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>', { desc = 'Toggle NeoTree' })
  end
}
