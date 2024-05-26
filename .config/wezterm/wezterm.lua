local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Gruvbox Material (Gogh)"

config.font = wezterm.font({
	family = "JetBrains Mono",
	weight = "Medium",
})

config.window_padding = {
	top = 0,
	right = 0,
	bottom = 0,
	left = 0,
}

config.hide_tab_bar_if_only_one_tab = true
config.font_size = 14
config.line_height = 1.2

return config
