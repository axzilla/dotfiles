return {
	enabled = true,
	"echasnovski/mini.files",
	config = function()
		local mini_files = require("mini.files")
		mini_files.setup({
			mappings = {
				synchronize = "<Leader>w",
			},
			options = {
				-- Linux/Mac: ~/.local/share/nvim/mini.files/trash/
				permanent_delete = false,
			},
		})
		vim.keymap.set("n", "<Leader>m", function()
			mini_files.open(vim.fn.expand("%:p"), false)
		end, { desc = "Open MiniFiles" })
	end,
}
