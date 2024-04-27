return {
	"RRethy/vim-illuminate",
	config = function()
		-- change the highlight style
		vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
		vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
		vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })

		--- auto update the highlight style on colorscheme change
		vim.api.nvim_create_autocmd({ "ColorScheme" }, {
			pattern = { "*" },
			callback = function()
				vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
				vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
				vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
			end,
		})
	end,
}
