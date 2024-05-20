return {
	"sindrets/diffview.nvim",
	config = function()
		local actions = require("diffview.actions")

		require("diffview").setup({
			key_bindings = {
				file_panel = {
					{
						"n",
						"<leader>e",
						actions.toggle_files,
						{ desc = "Toggle the file panel" },
					},
					{
						"n",
						"<leader>o",
						actions.focus_files,
						{ desc = "Bring focus to the file panel" },
					},
				},
				view = {
					{
						"n",
						"<leader>e",
						actions.toggle_files,
						{ desc = "Toggle the file panel" },
					},
					{
						"n",
						"<leader>o",
						actions.focus_files,
						{ desc = "Bring focus to the file panel" },
					},
				},
			},
		})

		local function toggle_diffview()
			local view = require("diffview.lib").get_current_view()
			if view then
				vim.cmd("DiffviewClose")
			else
				vim.cmd("DiffviewOpen")
			end
		end

		local function toggle_file_history()
			local view = require("diffview.lib").get_current_view()
			if view then
				vim.cmd("DiffviewClose")
			else
				vim.cmd("DiffviewFileHistory")
			end
		end

		vim.keymap.set(
			"n",
			"<leader>gdh",
			toggle_file_history,
			{ noremap = true, silent = true, desc = "Toggle File History" }
		)

		vim.keymap.set("n", "<leader>gdd", toggle_diffview, { noremap = true, silent = true, desc = "Toggle Diffview" })

		-- vim.keymap.set("n", "<leader>gdd", "<cmd>DiffviewOpen<cr>", { noremap = true, silent = true })
	end,
}
