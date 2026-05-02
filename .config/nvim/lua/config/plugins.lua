local plugins = {}

local path = vim.fn.stdpath("config") .. "/lua/plugins/"
for name, _ in vim.fs.dir(path) do
	if name:match("%.lua$") then
		local modname = "plugins" .. "." .. name:gsub("%.lua$", "")
		table.insert(plugins, require(modname))
	end
end

vim.pack.add(vim.tbl_map(function(plugin)
	return plugin[1]:gsub("^gh:", "https://github.com/")
end, plugins))

for _, p in ipairs(plugins) do
	_ = p.setup and p.setup()
end

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind

		vim.notify("Plugin updated: " .. name, vim.log.levels.INFO)

		if name == "nvim-treesitter" and kind == "update" then
			vim.cmd("TSUpdate")
		elseif name == "blink.cmp" and (kind == "install" or kind == "update") then
			require("blink.cmp").build():wait(60000)
		end
	end,
})
