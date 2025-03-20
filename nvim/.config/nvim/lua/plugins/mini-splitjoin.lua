return {
	"echasnovski/mini.splitjoin",
	config = function()
		local splitjoin = require("mini.splitjoin")
		splitjoin.setup()

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "go", "templ" },
			callback = function()
				vim.b.minisplitjoin_config = {
					split = {
						hooks_post = {
							splitjoin.gen_hook.add_trailing_separator(),
						},
					},
				}
			end,
		})
	end,
}
