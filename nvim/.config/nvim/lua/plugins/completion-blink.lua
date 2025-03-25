-- return {
-- 	"saghen/blink.cmp",
-- 	enabled = true,
-- 	-- INFO: Can remove the LSP capabilities and handlers in the lsp.lua from neovim 0.11.x?
-- 	dependencies = {
-- 		"rafamadriz/friendly-snippets",
-- 		"L3MON4D3/LuaSnip",
-- 	},
-- 	version = "*",
-- 	---@module 'blink.cmp'
-- 	---@type blink.cmp.Config
-- 	opts = {
-- 		-- Keymap preset: 'default', 'super-tab', or 'enter'
-- 		keymap = {
-- 			preset = "super-tab",
-- 			["<C-k>"] = { "select_prev", "fallback" },
-- 			["<C-j>"] = { "select_next", "fallback" },
-- 			["<C-u>"] = { "scroll_documentation_up" },
-- 			["<C-d>"] = { "scroll_documentation_down" },
-- 		},
-- 		completion = {
-- 			documentation = {
-- 				auto_show = true,
-- 				auto_show_delay_ms = 200,
-- 			},
-- 		},
-- 		signature = {
-- 			enabled = true,
-- 		},
-- 		appearance = {
-- 			use_nvim_cmp_as_default = true,
-- 			nerd_font_variant = "mono",
-- 		},
-- 		sources = {
-- 			default = { "lsp", "path", "snippets", "buffer"},
-- 			per_filetype = {
-- 				templ = { "lsp" }, -- Erzwingt LSP als Quelle für templ-Dateien
-- 			},
-- 		},
-- 		-- Rust fuzzy matcher for better performance
-- 		fuzzy = { implementation = "prefer_rust_with_warning" },
-- 	},
-- 	opts_extend = { "sources.default" },
-- }

return {
	{
		"saghen/blink.cmp",
		enabled = false,
		version = "*",
		opts = {
			-- keymap = {
			-- 	preset = "super-tab",
			-- 	["<C-k>"] = { "select_prev", "fallback" },
			-- 	["<C-j>"] = { "select_next", "fallback" },
			-- 	["<C-u>"] = { "scroll_documentation_up" },
			-- 	["<C-d>"] = { "scroll_documentation_down" },
			-- },
			completion = {
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
				},
			},
			signature = { enabled = true },
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
	},
	-- {
	-- 	"neovim/nvim-lspconfig",
	-- 	config = function()
	-- 		local capabilities = require("blink-cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())
	--
	-- 		require("lspconfig")["templ"].setup({
	-- 			capabilities = capabilities,
	-- 		})
	-- 	end,
	-- },
}
