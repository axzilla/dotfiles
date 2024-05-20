return {
	"echasnovski/mini.bufremove",
	config = function()
		local bufremove = require("mini.bufremove")
		bufremove.setup()

		vim.keymap.set("n", "<leader>c", function()
			bufremove.delete(0, false)
		end, { desc = "Close Buffer" })

		vim.keymap.set("n", "<leader>C", function()
			bufremove.delete(0, true)
		end, { desc = "Close Buffer (Force)" })
	end,
}
