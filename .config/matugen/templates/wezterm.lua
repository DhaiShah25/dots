return {
	-- The default text color, now using a contrasting on_surface color.
	foreground = "{{colors.on_surface.default.hex}}",
	-- The default background color, as requested, using the surface color.
	background = "{{colors.surface_bright.default.hex}}",

	-- The cursor color remains based on the 'primary_fixed' and 'on_primary_fixed' colors.
	cursor_bg = "{{colors.primary_fixed.default.hex}}",
	cursor_fg = "{{colors.on_primary_fixed.default.hex}}",
	cursor_border = "{{colors.primary_fixed.default.hex}}",

	-- Selection colors are set using 'inverse_on_surface' and 'primary_fixed_dim'.
	selection_fg = "{{colors.inverse_on_surface.default.hex}}",
	selection_bg = "{{colors.primary_fixed_dim.default.hex}}",

	-- The scrollbar thumb color uses a slightly darker shade for contrast.
	scrollbar_thumb = "{{colors.surface_container_high.default.hex}}",

	-- Split lines between panes use the 'surface_variant' color.
	split = "{{colors.surface_variant.default.hex}}",

	-- An empty table for indexed colors since we are using the palette.
	indexed = {},

	-- The compose cursor color is set to the 'tertiary' color for emphasis.
	compose_cursor = "{{colors.tertiary.default.hex}}",

	-- Colors for copy mode, using different shades for active and inactive highlights.
	copy_mode_active_highlight_bg = { Color = "{{colors.secondary_container.default.hex}}" },
	copy_mode_active_highlight_fg = { Color = "{{colors.tertiary_fixed.default.hex}}" },
	copy_mode_inactive_highlight_bg = { Color = "{{colors.surface_container_low.default.hex}}" },
	copy_mode_inactive_highlight_fg = { Color = "{{colors.primary_fixed.default.hex}}" },

	-- Quick select colors use the 'primary' and 'on_primary' colors.
	quick_select_label_bg = { Color = "{{colors.primary.default.hex}}" },
	quick_select_label_fg = { Color = "{{colors.on_primary.default.hex}}" },
	quick_select_match_bg = { Color = "{{colors.primary.default.hex}}" },
	quick_select_match_fg = { Color = "{{colors.on_primary.default.hex}}" },

	-- Input selector and launcher labels are based on the main background and foreground.
	input_selector_label_bg = { Color = "{{colors.surface.default.hex}}" },
	input_selector_label_fg = { Color = "{{colors.on_surface.default.hex}}" },
	launcher_label_bg = { Color = "{{colors.surface.default.hex}}" },
	launcher_label_fg = { Color = "{{colors.on_surface.default.hex}}" },
}
