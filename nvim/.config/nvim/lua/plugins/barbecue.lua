return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic", -- required
		"nvim-tree/nvim-web-devicons", -- optional
	},
	config = function()
		local barbecue = require("barbecue")
		local barbecue_ui = require("barbecue.ui")

		barbecue.setup({
			attach_navic = true, -- Navic für Code-Kontext aktivieren
			show_dirname = true, -- Verzeichnis anzeigen
			show_basename = true, -- Dateiname anzeigen
			show_modified = true, -- Anzeigen, wenn die Datei geändert wurde
			context_follow_cursor = true, -- Kontext basierend auf Cursor-Position anzeigen
			theme = "auto", -- Farbschema automatisch aus Neovim-Theme nehmen
			symbols = {
				separator = "›", -- Schöneres Trennzeichen
				ellipsis = "…", -- Zeichen für gekürzte Pfade
				modified = "●", -- Zeichen für geänderte Dateien
			},
			kinds = {
				-- Symbole für verschiedene Code-Elemente
				File = "󰈙",
				Module = "",
				Namespace = "󰅪",
				Package = "󰏗",
				Class = "󰌗",
				Method = "󰆧",
				Property = "",
				Field = "󰜢",
				Constructor = "",
				Enum = "",
				Interface = "",
				Function = "󰊕",
				Variable = "󰀫",
				Constant = "󰏿",
				String = "󰀬",
				Number = "󰎠",
				Boolean = "󰨙",
				Array = "󰅪",
				Object = "󰅩",
				Key = "󰌋",
				Null = "󰟢",
				EnumMember = "",
				Struct = "󰌗",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "󰊄",
			},
		})

		local barbecue_enabled = true
		local function toggle_barbecue()
			barbecue_ui.toggle()
			barbecue_enabled = not barbecue_enabled
			vim.notify("Barbecue " .. (barbecue_enabled and "enabled" or "disabled"))
		end

		vim.keymap.set("n", "<leader>ub", toggle_barbecue, { desc = "Toggle Barbecue" })
	end,
}
