return {
	enabled = true,
	"echasnovski/mini.files",
	config = function()
		local mini_files = require("mini.files")
		mini_files.setup({
			mappings = {
				synchronize = "<Leader>w",
			},
		})

		vim.keymap.set("n", "<Leader>m", function()
			mini_files.open(vim.fn.expand("%:p"), false)
		end, { desc = "Open MiniFiles" })
	end,
}
