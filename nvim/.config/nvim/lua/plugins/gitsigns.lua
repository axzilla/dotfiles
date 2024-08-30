return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gs = require("gitsigns")

		gs.setup({
			signs = {
				-- add = { text = "+" },
				-- change = { text = "~" },
				-- delete = { text = "-" },
				-- topdelete = { text = "‾" },
				-- changedelete = { text = "~" },
			},
		})

		local keymap = vim.keymap

		keymap.set("n", "]g", gs.next_hunk, { desc = "Gitsigns Next Hunk" })
		keymap.set("n", "[g", gs.prev_hunk, { desc = "Gitsigns Previous Hunk" })
		keymap.set("n", "<Leader>ggb", gs.blame_line, { desc = "Gitsigns View Blame" })
		keymap.set("n", "<Leader>ggB", gs.toggle_current_line_blame, { desc = "Gitsigns Toogle Blame" })
		keymap.set("n", "<Leader>ggp", gs.preview_hunk_inline, { desc = "Gitsigns Preview Hunk" })
		keymap.set("n", "<Leader>ggr", gs.reset_hunk, { desc = "Gitsigns Reset Hunk" })
		keymap.set("n", "<Leader>ggR", gs.reset_buffer, { desc = "Gitsigns Reset Buffer" })
		keymap.set("n", "<Leader>ggs", gs.stage_hunk, { desc = "Gitsigns Stage Hunk" })
		keymap.set("n", "<Leader>ggS", gs.stage_buffer, { desc = "Gitsigns Stage Buffer" })
		keymap.set("n", "<Leader>ggu", gs.undo_stage_hunk, { desc = "Gitsigns Unstage Hunk" })
		keymap.set("n", "<Leader>ggd", gs.diffthis, { desc = "Gitsigns View Diff" })
	end,
}
