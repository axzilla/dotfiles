local icons = require("config.icons").icons

vim.filetype.add({ extension = { templ = "templ" } })

return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		-- Import required modules
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")
		require("luasnip.loaders.from_vscode").lazy_load()

		-- Setup diagnostics
		local function setup_diagnostics()
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

			-- Configure diagnostic display
			vim.diagnostic.config({ float = { border = "rounded" } })

			-- Global diagnostic keymaps
			vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Hover Diagnostics" })
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
		end

		-- Setup LSP keymaps
		local function setup_lsp_keymaps(event)
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
		end

		-- LSP Setup
		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
		local handlers = {
			["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
			["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
		}

		local function default_setup(server)
			require("lspconfig")[server].setup({
				capabilities = lsp_capabilities,
				handlers = handlers,
			})
		end

		-- Initialize everything
		setup_diagnostics()

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = setup_lsp_keymaps,
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
			},
			handlers = {
				default_setup,
				lua_ls = function()
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
