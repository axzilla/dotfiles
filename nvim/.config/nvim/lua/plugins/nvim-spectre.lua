return {
	"nvim-pack/nvim-spectre",
	config = function()
		require("spectre").setup({
			find_engine = {
				["rg"] = {
					cmd = "rg",
					args = {
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--hidden",
						"--glob=!.git", -- ignoriert .git Ordner
					},
				},
			},
		})

		vim.keymap.set("n", "<leader>ss", '<cmd>lua require("spectre").toggle()<CR>', {
			desc = "Toggle Spectre",
		})
		vim.keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
			desc = "Search Word (Workspace)",
		})
		vim.keymap.set("n", "<leader>sb", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
			desc = "Search Word (Buffer)",
		})
	end,
}
