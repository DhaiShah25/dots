local templates = vim.fn.readdir("/home/gale/vault/templates/")

vim.keymap.set("n", "<leader>ti", function()
	vim.ui.select(templates, {}, function(choice)
		if not choice then
			return
		end
		vim.cmd("0")
		vim.cmd("read " .. "/home/gale/vault/templates/" .. choice)
	end)
end)

vim.keymap.set("n", "<leader>nn", function()
	vim.cmd.Oil("/home/gale/vault/")
end)

vim.keymap.set("n", "<leader>nq", function()
	Snacks.picker.files({ cwd = "/home/gale/vault" })
end)

vim.keymap.set("n", "<leader>ns", function()
	Snacks.picker.grep({ cwd = "/home/gale/vault" })
end)
