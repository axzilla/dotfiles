-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
	pattern = "*",
})

-- Set wrap and linebreak
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "txt" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "go", "templ" },
	callback = function()
		vim.bo.expandtab = false -- Go idiomatisch: TABS
		vim.bo.tabstop = 4 -- Standard Go tab width
		vim.bo.shiftwidth = 4
	end,
})
