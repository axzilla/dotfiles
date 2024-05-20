return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[                                              ]],
			[[                                              ]],
			[[                                              ]],
			[[                                              ]],
			[[               ^__^                           ]],
			[[               (oo)\_______                   ]],
			[[               (__)\       )\/\               ]],
			[[                    ||----w |                 ]],
			[[                    ||     ||                 ]],
			[[                                              ]],
		}

		dashboard.section.buttons.val = {
			dashboard.button("n", " " .. " New file", "<cmd> ene <BAR> startinsert <cr>"),
			dashboard.button("f", " " .. " Find Files", "<cmd> Telescope find_files <cr>"),
			dashboard.button("g", " " .. " Find Grep", "<cmd> Telescope live_grep <cr>"),
			dashboard.button("o", " " .. " Find Old files", "<cmd> Telescope oldfiles <cr>"),
			dashboard.button("s", " " .. " Last Session", "<cmd> SessionRestore <cr>"),
			dashboard.button("l", "󰒲 " .. " Lazy", "<cmd> Lazy <cr>"),
			dashboard.button("q", " " .. " Quit", "<cmd> qa <cr>"),
		}

		-- Add padding at the beginning to center the content vertically
		dashboard.config.layout = {
			{ type = "padding", val = 8 },
			dashboard.section.header,
			{ type = "padding", val = 2 },
			dashboard.section.buttons,
			{ type = "padding", val = 2 },
		}

		alpha.setup(dashboard.config)
	end,
}
