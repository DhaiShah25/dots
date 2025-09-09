return {
	-- The default text color, now using a contrasting on_surface color.
	foreground = "#e6e1e9",
	-- The default background color, as requested, using the surface color.
	background = "#3a383e",

	-- The cursor color remains based on the 'primary_fixed' and 'on_primary_fixed' colors.
	cursor_bg = "#e7deff",
	cursor_fg = "#1d1148",
	cursor_border = "#e7deff",

	-- Selection colors are set using 'inverse_on_surface' and 'primary_fixed_dim'.
	selection_fg = "#312f35",
	selection_bg = "#cbbeff",

	-- The scrollbar thumb color uses a slightly darker shade for contrast.
	scrollbar_thumb = "#2b292f",

	-- Split lines between panes use the 'surface_variant' color.
	split = "#48454e",

	-- An empty table for indexed colors since we are using the palette.
	indexed = {},

	-- The compose cursor color is set to the 'tertiary' color for emphasis.
	compose_cursor = "#eeb8cb",

	-- Colors for copy mode, using different shades for active and inactive highlights.
	copy_mode_active_highlight_bg = { Color = "#484458" },
	copy_mode_active_highlight_fg = { Color = "#ffd9e5" },
	copy_mode_inactive_highlight_bg = { Color = "#1c1b20" },
	copy_mode_inactive_highlight_fg = { Color = "#e7deff" },

	-- Quick select colors use the 'primary' and 'on_primary' colors.
	quick_select_label_bg = { Color = "#cbbeff" },
	quick_select_label_fg = { Color = "#33275e" },
	quick_select_match_bg = { Color = "#cbbeff" },
	quick_select_match_fg = { Color = "#33275e" },

	-- Input selector and launcher labels are based on the main background and foreground.
	input_selector_label_bg = { Color = "#141318" },
	input_selector_label_fg = { Color = "#e6e1e9" },
	launcher_label_bg = { Color = "#141318" },
	launcher_label_fg = { Color = "#e6e1e9" },
}
