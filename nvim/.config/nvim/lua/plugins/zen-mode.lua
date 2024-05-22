return {
	"folke/zen-mode.nvim",
	opts = {
		plugins = {
			tmux = { enabled = true },
			options = {
				laststatus = 0, -- turn off the statusline (Lualine)
			},
		},
		on_open = function()
			-- HACK: This is a hack to fix the issue with barbecue not being hidden everytime (just the first time)
			require("barbecue.ui").toggle()
			vim.notify("Zen Mode enabled", "info", { title = "Zen Mode" })
		end,
		on_close = function()
			-- HACK: This is a hack to fix the issue with barbecue not being hidden everytime (just the first time)
			require("barbecue.ui").toggle()
			vim.notify("Zen Mode disabled", "info", { title = "Zen Mode" })
		end,
	},
	config = function(_, opts)
		local zen_mode = require("zen-mode")
		zen_mode.setup(opts)

		vim.keymap.set("n", "<leader>uz", function()
			zen_mode.toggle({
				window = {
					width = 1, -- width will be 85% of the editor width
				},
			})
		end, { desc = "Toggle Zen Mode" })
	end,
}
