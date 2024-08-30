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

		wk.add({
			{ "<leader>b", group = "Buffers" },
			{ "<leader>d", group = "Debugger" },
			{ "<leader>e", group = "Explorer/Files" },
			{ "<leader>f", group = "Find/Telescope" },
			{ "<leader>g", group = "Git" },
			{ "<leader>gd", group = "Diffview" },
			{ "<leader>gg", group = "Gitsigns" },
			{ "<leader>l", group = "LSP" },
			{ "<leader>o", group = "Obsidian" },
			{ "<leader>s", group = "Search" },
			{ "<leader>t", group = "Themes" },
			{ "<leader>u", group = "UI" },
			{ "<leader>x", group = "Trouble" },
		})
	end,
}
