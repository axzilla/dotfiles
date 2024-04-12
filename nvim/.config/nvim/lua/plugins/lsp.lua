return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- Note: diagnostics are not exclusive to lsp servers
		-- so these can be global keybindings
		vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "Hover Diagnostics" })
		vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Previous Diagnostic" })
		vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Next  Diagnostic" })

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function(event)
				local opts = { buffer = event.buf }

				-- These will be buffer-local keybindings
				-- because they only work if you have an active language server
				vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
				vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
				vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
				vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
				vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
				vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
				vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
				vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
				vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
				vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
			end,
		})

		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

		local default_setup = function(server)
			require("lspconfig")[server].setup({
				capabilities = lsp_capabilities,
			})
		end

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"tsserver",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"emmet_ls",
			},
			handlers = {
				default_setup,
				lua_ls = function()
					require("lspconfig").lua_ls.setup({
						capabilities = lsp_capabilities,
						settings = {
							Lua = {
								-- Make the language server recognize "vim" global
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettierd",
				"stylua",
				"eslint_d",
			},
		})

		local cmp = require("cmp")

		cmp.setup({
			sources = {
				{ name = "copilot" },
				{ name = "path" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
			},
			formatting = {
				format = function(entry, vim_item)
					vim_item.menu = ({
						copilot = "[Copilot]",
						path = "[Path]",
						nvim_lsp = "[LSP]",
						luasnip = "[LuaSnip]",
						buffer = "[Buffer]",
					})[entry.source.name]
					return vim_item
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},

			mapping = cmp.mapping.preset.insert({
				-- Select next and previous completion item
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),

				-- Close completion window
				["<C-e>"] = cmp.mapping.abort(),

				-- Scroll up and down the documentation window
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),

				-- Enter key confirms completion item
				["<CR>"] = cmp.mapping.confirm({ select = false }),

				-- Ctrl + space triggers completion menu
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
		})
	end,
}
