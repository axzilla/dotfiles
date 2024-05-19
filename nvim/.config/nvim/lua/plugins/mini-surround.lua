-- because :bd/:bdelete doesn't work with bufferline without bugs!
return {
	enabled = false,
	"echasnovski/mini.surround",
	config = function()
		require("mini.surround").setup()
	end,
}
