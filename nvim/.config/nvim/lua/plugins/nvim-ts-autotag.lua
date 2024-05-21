---@diagnostic disable: missing-parameter
return {
	"axzilla/nvim-ts-autotag",
	branch = "fix/templ-auto-rename",
	-- dir = "~/dev/nvim-ts-autotag",
	config = function()
		local ts_autotag = require("nvim-ts-autotag")
		ts_autotag.setup()
	end,
}
