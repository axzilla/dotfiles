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
		local handle = io.popen("fortune")
		local fortune = handle:read("*a")
		handle:close()
		dashboard.section.footer.val = fortune

		dashboard.config.opts.noautocmd = true

		vim.cmd([[autocmd User AlphaReady echo 'ready']])

		alpha.setup(dashboard.config)
	end,
}
