return {
	"sindrets/diffview.nvim",
	config = function()
		local diffview = require("diffview")
		local actions = require("diffview.actions")

		diffview.setup({
			key_bindings = {
				file_panel = {
					{ "n", "<leader>e", actions.toggle_files, { desc = "toggle the file panel" } },
					{ "n", "<leader>o", actions.focus_files, { desc = "bring focus to the file panel" } },
					{ "n", "q", diffview.close, { desc = "close diffview" } },
				},
				file_history_panel = {
					{ "n", "<leader>e", actions.toggle_files, { desc = "toggle the file panel" } },
					{ "n", "<leader>o", actions.focus_files, { desc = "bring focus to the file panel" } },
					{ "n", "q", diffview.close, { desc = "close diffview" } },
				},
				view = {
					{ "n", "<leader>e", actions.toggle_files, { desc = "Toggle the file panel" } },
					{ "n", "<leader>o", actions.focus_files, { desc = "Bring focus to the file panel" } },
					{ "n", "q", diffview.close, { desc = "Close Diffview" } },
				},
			},
		})

		vim.keymap.set("n", "<leader>go", "<cmd>DiffviewOpen<cr>", { desc = "Diffview" })
		vim.keymap.set("n", "<leader>gH", "<cmd>DiffviewFileHistory<cr>", { desc = "History (Repo)" })
		vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", { desc = "History (File)" })
	end,
}
