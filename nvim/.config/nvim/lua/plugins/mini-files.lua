return {
	enabled = true,
	"echasnovski/mini.files",
	config = function()
		local mini_files = require("mini.files")
		mini_files.setup({})

		vim.keymap.set("n", "<Leader>em", function()
			mini_files.open(vim.fn.expand("%:p"), false)
		end, { desc = "Open MiniFiles (Buffer)" })

		vim.keymap.set("n", "<Leader>eM", function()
			mini_files.open(vim.fn.getcwd(), false)
		end, { desc = "Open MiniFiles (cwd)" })
	end,
}
