local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

local fd = "/usr/bin/env"

M.toggle = function(window, pane)
	local projects = {}

	local success, stdout, stderr = wezterm.run_child_process({
		"/usr/bin/env",
		"fd",
		".",
		"--max-depth=1",
		"--type=d",
		os.getenv("HOME") .. "/dev",
		os.getenv("HOME"),
	})

	if not success then
		wezterm.log_error("Failed to run fd: " .. stderr)
		return
	end

	for line in stdout:gmatch("([^\n]*)\n?") do
		local project = line:gsub("/$", "")
		local label = project
		local id = project:gsub(".*/", "")
		table.insert(projects, { label = tostring(label), id = tostring(id) })
	end

	window:perform_action(
		act.InputSelector({
			action = wezterm.action_callback(function(win, _, id, label)
				if not id and not label then
					wezterm.log_info("Cancelled")
				else
					wezterm.log_info("Selected " .. label)
					win:perform_action(
						act.SwitchToWorkspace({ name = id, spawn = { args = { "nu" }, cwd = label } }),
						pane
					)
				end
			end),
			fuzzy = true,
			title = "Select Project",
			choices = projects,
		}),
		pane
	)
end

return M
