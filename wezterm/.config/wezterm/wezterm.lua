local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.native_macos_fullscreen_mode = false
config.font = wezterm.font("JetBrains Mono", { weight = "Bold", italic = true })
config.hide_tab_bar_if_only_one_tab = true
config.font_size = 14

return config
