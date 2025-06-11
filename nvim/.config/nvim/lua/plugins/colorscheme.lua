return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      -- vim.cmd("colorscheme gruvbox")
    end,
    opts = {}
  },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        theme = "dragon",
        transparent = false,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
      })
      -- vim.cmd("colorscheme kanagawa-dragon")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      no_italic = true,
      term_colors = true,
      transparent_background = false,
      styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
      },
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      },
      integrations = {
        -- telescope = {
        -- 	enabled = true,
        -- 	style = "nvchad",
        -- },
        dropbar = {
          enabled = true,
          color_mode = true,
        },
      },
    },
  },
}
