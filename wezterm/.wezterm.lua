-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.font = wezterm.font("JetBrains Mono")
config.hide_tab_bar_if_only_one_tab = true
-- You can specify some parameters to influence the font selection;
-- for example, this selects a Bold, Italic font variant.
-- config.font = wezterm.font("JetBrains Mono", { weight = "Bold", italic = true })
-- For example, changing the color scheme:
-- config.color_scheme = "AdventureTime"
--
-- and finally, return the configuration to wezterm
return config
