hl.workspace_rule({
	workspace = "1",
	on_created_empty = "uwsm app firefox",
	monitor = "HDMI-A-1",
	default_name = "󰖟",
})
hl.workspace_rule({ workspace = "2", on_created_empty = "uwsm app ghostty", monitor = "HDMI-A-1", default_name = "" })
hl.workspace_rule({
	workspace = "3",
	on_created_empty = "uwsm app obsidian",
	monitor = "HDMI-A-1",
	default_name = "",
})

for w = 4, 7 do
	hl.workspace_rule({ workspace = tostring(w), monitor = "HDMI-A-1" })
end

hl.workspace_rule({ workspace = "8", monitor = "eDP-1", default_name = "󰈙" })
for w = 9, 10 do
	hl.workspace_rule({ workspace = tostring(w), monitor = "eDP-1" })
end

hl.monitor({
	output = "HDMI-A-1",
	mode = "preferred",
	scale = "1",
	position = "auto-left",
	vrr = true,
})

hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "auto-right",
	scale = "1",
})
