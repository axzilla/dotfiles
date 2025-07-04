---@diagnostic  isable-next-line: undefined-global
local vim = vim
local icons = require("config.icons").icons

vim.filetype.add({ extension = { templ = "templ" } })

return {
  "williamboman/mason.nvim",
  enabled = true,
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")
    -- require("luasnip.loaders.from_vscode").lazy_load()

    -- Set diagnostic icons
    local signs = {
      Error = icons.misc.Flame,
      Warn = icons.misc.Flame,
      Hint = icons.misc.Flame,
      Info = icons.misc.Flame,
    }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Global diagnostic keymaps
    vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Hover Diagnostics" })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })

    -- LSP Setup
    local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Setup LSP keymaps
    vim.api.nvim_create_autocmd("LspAttach", {
      desc = "LSP actions",
      callback = function(event)
        local opts = { buffer = event.buf }
        local function map(key, func, desc)
          opts.desc = desc
          vim.keymap.set("n", key, func, opts)
        end

        -- Navigation
        map("gd", vim.lsp.buf.definition, "Go to Definition")
        map("gr", vim.lsp.buf.references, "Find References")
        map("gi", vim.lsp.buf.implementation, "Go to Implementation")
        map("K", vim.lsp.buf.hover, "Hover Documentation")
        map("gs", vim.lsp.buf.signature_help, "Signature Help")

        -- Actions
        map("<leader>la", vim.lsp.buf.code_action, "Code Actions")
        map("<leader>lr", vim.lsp.buf.rename, "Rename Symbol")

        -- LSP management
        map("<leader>li", "<cmd>LspInfo<cr>", "LSP Info")
        map("<leader>ls", "<cmd>LspRestart<cr>", "LSP Restart")
      end,
    })

    -- Mason setup
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- Configure language servers
    mason_lspconfig.setup({
      ensure_installed = {
        "tsserver",
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "emmet_ls",
        "gopls",
        "templ",
        "htmx",
        "astro",
        "bashls",
        "docker_compose_language_service",
        "dockerls",
      },
      automatic_installation = true,
      handlers = {
        function(server)
          require("lspconfig")[server].setup({
            capabilities = lsp_capabilities,
          })
        end,
        lua_ls = function()
          -- Special setup for Lua
          require("lspconfig").lua_ls.setup({
            capabilities = lsp_capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          })
        end,
        templ = function()
          require("lspconfig").templ.setup({
            capabilities = lsp_capabilities,
          })
        end,
        -- tailwindcss
        tailwindcss = function()
          require("lspconfig").tailwindcss.setup({
            capabilities = lsp_capabilities,
            filetypes = { "templ", "astro", "javascript", "typescript", "react" },
            init_options = { userLanguages = { templ = "html" } },
          })
        end,
        html = function()
          require("lspconfig").html.setup({
            capabilities = lsp_capabilities,
            filetypes = { "html", "templ" },
          })
        end,
        htmx = function()
          require("lspconfig").htmx.setup({
            capabilities = lsp_capabilities,
            filetypes = { "html", "templ" },
          })
        end,
      },
    })
    -- Configure formatters/linters
    mason_tool_installer.setup({
      ensure_installed = {
        "prettierd",
        "stylua",
        "eslint_d",
        "goimports",
      },
    })
  end,
}
