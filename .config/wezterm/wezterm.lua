local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.default_prog = { "nu" }

config.initial_cols = 120
config.initial_rows = 28

config.font_size = 14
config.color_scheme = "nord"

config.font = wezterm.font("MonaspiceNe NFM")

config.window_background_opacity = 0.8

local sessionizer = require("sessionizer")
config.keys = {
	{ key = "l", mods = "ALT", action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
	{ key = "f", mods = "ALT", action = wezterm.action_callback(sessionizer.toggle) },
}

local colors = require("colors")
config.colors = colors

return config
