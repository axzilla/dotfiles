local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.window_background_opacity = 0.80
config.macos_window_background_blur = 20
config.color_scheme = "solarized_dark"

config.native_macos_fullscreen_mode = false
config.font = wezterm.font({
	family = "JetBrains Mono",
	weight = "Medium",
})
--
config.window_padding = {
	bottom = 0,
}

config.hide_tab_bar_if_only_one_tab = true
config.font_size = 14
config.line_height = 1.2

return config
