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

		-- Set rounded borders for diagnostic popups.
		vim.diagnostic.config({ float = { border = "rounded" } })

		-- Note: diagnostics are not exclusive to lsp servers
		-- so these can be global keybindings.
		vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "Hover Diagnostics" })
		vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Previous Diagnostic" })
		vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Next  Diagnostic" })

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function(event)
				local opts = { buffer = event.buf }

				-- These will be buffer-local keybindings
				-- because they only work if you have an active language server.
				-- TODO: Optional -> Take a look at kickstarts keymap solution and redesign.
				opts.desc = "Hover Diagnostic"
				vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
				vim.keymap.set("n", "<leader>ld", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)

				opts.desc = "Go to Definition"
				vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)

				opts.desc = "Go to Declaration"
				vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)

				opts.desc = "Go to Implementation"
				vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)

				opts.desc = "Go to Type Definition"
				vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)

				opts.desc = "Find References"
				vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
				vim.keymap.set("n", "<leader>lR", "<cmd>Telescope lsp_references<cr>", opts)

				opts.desc = "Signature Help"
				vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
				vim.keymap.set("n", "<leader>lh", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)

				opts.desc = "Rename Symbol"
				vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)

				opts.desc = "Document Symbols"
				vim.keymap.set("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", opts)

				opts.desc = "Workspace Symbols"
				vim.keymap.set("n", "<leader>fS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", opts)

				opts.desc = "LSP Info"
				vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", opts)

				opts.desc = "Format Buffer"
				vim.keymap.set({ "n", "x" }, "<leader>lf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)

				opts.desc = "Code Actions"
				vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

				opts.desc = "Find Diagnostics"
				vim.keymap.set("n", "<leader>lD", "<cmd>Telescope diagnostics<CR>", opts)
			end,
		})

		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

		local handlers = {
			-- Set rounded borders for hover and diagnostic popups.
			["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
			["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
		}

		local default_setup = function(server)
			require("lspconfig")[server].setup({
				capabilities = lsp_capabilities,
				handlers = handlers,
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
								-- Make the language server recognize "vim" global.
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
				-- Select next and previous completion item.
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),

				-- Close completion window.
				["<C-e>"] = cmp.mapping.abort(),

				-- Scroll up and down the documentation window.
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),

				-- Enter key confirms completion item.
				["<CR>"] = cmp.mapping.confirm({ select = false }),

				-- Ctrl + space triggers completion menu.
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
