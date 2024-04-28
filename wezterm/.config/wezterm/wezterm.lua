local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.native_macos_fullscreen_mode = false
config.font = wezterm.font("JetBrains Mono")
config.hide_tab_bar_if_only_one_tab = true
config.background = {
	{
		opacity = 0.15,
		-- blur = 70,
		height = "Cover",
		width = "Cover",
		repeat_x = "NoRepeat",
		repeat_y = "NoRepeat",
		vertical_align = "Middle",
		horizontal_align = "Center",
		source = {
			File = os.getenv("HOME") .. "/.config/wezterm/bg.jpeg",
		},
	},
}

return config
