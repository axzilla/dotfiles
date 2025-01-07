local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- config.color_scheme = "Kanagawa Dragon (Gogh)"
-- config.colors = { background = "#181616" } -- Kanagawa Dragon background color
config.color_scheme = "Oxocarbon Dark (Gogh)"

config.font = wezterm.font({
	family = "JetBrains Mono",
})

config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

config.window_padding = {
	top = 0,
	right = 0,
	bottom = 0,
	left = 0,
}

config.hide_tab_bar_if_only_one_tab = true
config.font_size = 13

return config
