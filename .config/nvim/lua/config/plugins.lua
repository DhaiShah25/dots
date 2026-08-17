local plugins = {}

local path = vim.fn.stdpath("config") .. "/lua/plugins/"
for name, _ in vim.fs.dir(path) do
	if name:match("%.lua$") then
		local modname = "plugins" .. "." .. name:gsub("%.lua$", "")
		table.insert(plugins, require(modname))
	end
end

plugins = vim.tbl_map(function(plugin)
	plugin.src = plugin[1]:gsub("^gh:", "https://github.com/")
	plugin[1] = nil
	return plugin
end, plugins)
vim.pack.add(plugins)

for _, p in ipairs(plugins) do
	if p.data and p.data.setup then
		local status, err = pcall(p.data.setup)
		if not status then
			vim.notify("Failed to run setup: " .. tostring(err), vim.log.levels.ERROR)
		end
	end
end

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind

		vim.notify("Plugin updated: " .. name, vim.log.levels.INFO)

		if name == "nvim-treesitter" and kind == "update" then
			vim.cmd("TSUpdate")
		end
	end,
})
