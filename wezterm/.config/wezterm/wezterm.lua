local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.window_background_opacity = 0.8
config.macos_window_background_blur = 20

config.native_macos_fullscreen_mode = false
config.font = wezterm.font({
	family = "JetBrains Mono",
	-- family = "Fira Code",
	-- family = "Monaspace Neon",
	-- family = "Monaspace Argon",
	-- family = "Monaspace Xenon",
	-- family = "Monaspace Radon",
	-- family = "Monaspace Krypton",
	weight = "Medium",
	-- italic = true,
})

config.window_padding = { bottom = 0 }
config.hide_tab_bar_if_only_one_tab = true
config.font_size = 14
config.line_height = 1.2

return config
