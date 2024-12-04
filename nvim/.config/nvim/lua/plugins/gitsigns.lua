return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gs = require("gitsigns")

		gs.setup({})

		local keymap = vim.keymap

		keymap.set("n", "]g", function()
			gs.nav_hunk("next")
		end, { desc = "Gitsigns Next Hunk" })
		keymap.set("n", "[g", function()
			gs.nav_hunk("prev")
		end, { desc = "Gitsigns Previous Hunk" })
		keymap.set("n", "<Leader>gp", gs.preview_hunk_inline, { desc = "Preview Hunk" })
		keymap.set("n", "<Leader>gr", gs.reset_hunk, { desc = "Reset Hunk" })
		keymap.set("n", "<Leader>gR", gs.reset_buffer, { desc = "Reset Buffer" })
		keymap.set("n", "<Leader>gs", gs.stage_hunk, { desc = "Stage Hunk" })
		keymap.set("n", "<Leader>gS", gs.stage_buffer, { desc = "Stage Buffer" })
		keymap.set("n", "<Leader>gu", gs.undo_stage_hunk, { desc = "Unstage Hunk" })
	end,
}
