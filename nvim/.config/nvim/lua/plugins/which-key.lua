return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {},
	config = function()
		local wk = require("which-key")

		wk.setup({
			icons = {
				mappings = false, -- This enables icons for mappings
			},
			preset = "modern",
		})

		wk.add({
			{ "<leader>b", group = "Buffers" },
			{ "<leader>d", group = "Debugger" },
			{ "<leader>f", group = "Find/Telescope" },
			{ "<leader>g", group = "Git" },
			{ "<leader>l", group = "LSP" },
			{ "<leader>s", group = "Search" },
			{ "<leader>t", group = "Themes" },
			{ "<leader>u", group = "UI" },
			{ "<leader>x", group = "Trouble" },
		})
	end,
}
