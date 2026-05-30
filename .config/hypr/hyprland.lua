require("wm.workspaces_and_monitors")
require("wm.keybinds")
require("wm.asthetics")
require("wm.window_rules")

hl.on("hyprland.start", function()
	hl.exec_cmd("clipse -listen")
	hl.exec_cmd("hyprsunset & hypridle & foot -s & hyprpaper & quickshell")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-----------------------
----- PERMISSIONS -----
-----------------------

hl.config({
	ecosystem = {
		enforce_permissions = true,
	},
})

hl.permission({ binary = "/nix/store/.*/grimblast", type = "screencopy", mode = "allow" })
hl.permission({ binary = "/nix/store/.*/grim", type = "screencopy", mode = "allow" })
hl.permission({ binary = "/nix/store/.*/hyprlock", type = "screencopy", mode = "allow" })
hl.permission({ binary = "/nix/store/.*/xdg-desktop-portal-hyprland", type = "screencopy", mode = "allow" })

hl.config({
	dwindle = {
		preserve_split = true,
	},
})

hl.config({
	master = {
		new_status = "master",
	},
})

hl.config({
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
	},
})

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "basic,colemak",
		kb_options = "compose:ralt,grp:win_space_toggle",

		follow_mouse = 1,

		sensitivity = 0,

		touchpad = {
			natural_scroll = false,
		},

		tablet = {
			output = "current",
		},
	},
})
