-- Inspired by LazyNvim

local M = {}

M.icons = {
	misc = {
		Dots = "󰇘",
		Macro = " ",
		Folder = "󱃪 ",
		File = " ",
		LSP = " ",
		Dot = " ",
		Flame = " ",
		Git = " ",
		Record = "",
	},
	diagnostics = {
		-- Error = " ",
		-- Warn = " ",
		-- Hint = " ",
		-- Info = " ",
		Error = " ",
		Warn = " ",
		Hint = " ",
		Info = " ",
	},
	git = {
		Added = "┃",
		Modified = "┃ ",
		Removed = "_",
	},
	kinds = {
		-- Array = " ",
		-- Boolean = "󰨙 ",
		-- Class = " ",
		-- Codeium = "󰘦 ",
		-- Color = " ",
		-- Control = " ",
		-- Collapsed = " ",
		-- Constant = "󰏿 ",
		-- Constructor = " ",
		Copilot = " ",
		-- Enum = " ",
		-- EnumMember = " ",
		-- Event = " ",
		-- Field = " ",
		-- File = " ",
		-- Folder = " ",
		-- Function = "󰊕 ",
		-- Interface = " ",
		-- Key = " ",
		-- Keyword = " ",
		-- Method = "󰊕 ",
		-- Module = " ",
		-- Namespace = "󰦮 ",
		-- Null = " ",
		-- Number = "󰎠 ",
		-- Object = " ",
		-- Operator = " ",
		-- Package = " ",
		-- Property = " ",
		-- Reference = " ",
		-- Snippet = " ",
		-- String = " ",
		-- Struct = "󰆼 ",
		-- TabNine = "󰏚 ",
		-- Text = " ",
		-- TypeParameter = " ",
		-- Unit = " ",
		-- Value = " ",
		-- Variable = "󰀫 ",
	},
}

return M
