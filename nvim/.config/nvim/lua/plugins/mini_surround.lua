-- because :bd/:bdelete doesn't work with bufferline without bugs!
return {
	"echasnovski/mini.surround",
	config = function()
		require("mini.surround").setup()
	end,
}
