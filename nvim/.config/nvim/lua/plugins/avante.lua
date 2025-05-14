return {
  "yetone/avante.nvim",
  enabled = false,
  event = "VeryLazy",
  version = false,      -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  opts = {
    provider = "copilot", -- Copilot als Provider festlegen
    copilot = {
      -- endpoint = "https://api.anthropic.com",
      model = "claude-3.7-sonnet", -- Claude 3.7 Sonnet-Modell
      max_tokens = 8000,        -- Maximale Token-Anzahl
      temperature = 0,          -- Optional: Steuert die Kreativität (0 = deterministisch)
    },
    -- provider = "claude", -- Claude als Provider festlegen
    -- claude = {
    -- 	endpoint = "https://api.anthropic.com",
    -- 	model = "claude-3-7-sonnet-20250219", -- Claude 3.7 Sonnet-Modell
    -- 	max_tokens = 8000, -- Maximale Token-Anzahl
    -- 	temperature = 0, -- Optional: Steuert die Kreativität (0 = deterministisch)
    -- },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick",       -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp",            -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua",            -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua",      -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
