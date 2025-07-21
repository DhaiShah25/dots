-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- config.enable_tab_bar = false

-- or, changing the font size and color scheme.
config.font_size = 14
config.color_scheme = "nord"

config.font = wezterm.font("MonaspiceNe NFM")

config.window_background_opacity = 0.8

local sessionizer = require("sessionizer")
config.keys = { { key = "f", mods = "CTRL", action = wezterm.action_callback(sessionizer.toggle) } }

return config
