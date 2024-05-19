return {
	"echasnovski/mini.bufremove",
	config = function()
		require("mini.bufremove").setup()
		vim.keymap.set("n", "<leader>c", function()
			require("mini.bufremove").delete(0, false)
		end, { desc = "Close Buffer" })
		vim.keymap.set("n", "<leader>C", function()
			require("mini.bufremove").delete(0, true)
		end, { desc = "Close Buffer (Force)" })
	end,
}
