return {
	"rmagatti/auto-session",
	config = function()
		require("auto-session").setup({
			auto_restore_enabled = false,
			log_level = "error",
			auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			pre_save_cmds = { "Neotree close" },
		})

		-- vim.keymap.set("n", "<leader>sd", "<cmd>:Autosession delete<cr>", { desc = "Delete Session" })
		-- vim.keymap.set(
		-- 	"n",
		-- 	"<leader>sf",
		-- 	require("auto-session.session-lens").search_session,
		-- 	{ desc = "Find Session" }
		-- )
	end,
}
