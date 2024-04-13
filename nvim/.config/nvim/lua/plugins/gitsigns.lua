return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			-- signs = {
			-- add = { text = "+" },
			-- change = { text = "~" },
			-- delete = { text = "-" },
			-- topdelete = { text = "‾" },
			-- changedelete = { text = "~" },
			-- },
		})
		local keymap = vim.keymap
		local gs = require("gitsigns")

		keymap.set("n", "]g", gs.next_hunk, { desc = "Next Hunk" })
		keymap.set("n", "[g", gs.prev_hunk, { desc = "Previous Hunk" })
		keymap.set("n", "<Leader>gb", gs.blame_line, { desc = "View Blame" })
		keymap.set("n", "<Leader>gB", gs.toggle_current_line_blame, { desc = "Toogle Blame" })
		keymap.set("n", "<Leader>gp", gs.preview_hunk_inline, { desc = "Preview Hunk" })
		keymap.set("n", "<Leader>gr", gs.reset_hunk, { desc = "Reset Hunk" })
		keymap.set("n", "<Leader>gR", gs.reset_buffer, { desc = "Reset Buffer" })
		keymap.set("n", "<Leader>gs", gs.stage_hunk, { desc = "Stage Hunk" })
		keymap.set("n", "<Leader>gS", gs.stage_buffer, { desc = "Stage Buffer" })
		keymap.set("n", "<Leader>gu", gs.undo_stage_hunk, { desc = "Unstage Hunk" })
		keymap.set("n", "<Leader>gd", gs.diffthis, { desc = "View Diff" })
	end,
}
