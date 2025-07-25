local state = {
	floating = {
		buf = -1,
		win = -1,
	},
}

local function get_project_name()
	local cwd = vim.fn.getcwd()
	local project_name = vim.fn.fnamemodify(cwd, ":t")
	return project_name
end

local function get_new_file_path()
	local project_name = get_project_name()
	local full_path = "/home/gale/vault/projects/" .. project_name .. ".md"
	full_path = vim.fn.fnamemodify(full_path, ":p")
	return full_path
end

local function create_floating_window(opts)
	local width = math.floor(vim.o.columns * 0.8)
	local height = math.floor(vim.o.lines * 0.8)

	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)

	local buf = nil
	if vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, false)
	end

	local win_config = {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal",
		border = "rounded",
	}

	local win = vim.api.nvim_open_win(buf, true, win_config)

	return { win = win, buf = buf }
end

vim.keymap.set("n", "<leader>td", function()
	if not vim.api.nvim_win_is_valid(state.floating.win) then
		state.floating = create_floating_window({ buf = state.floating.buf })
		if vim.bo[state.floating.buf].buftype ~= "markdown" then
			buf = vim.cmd.edit(get_new_file_path())
		end
	else
		vim.api.nvim_win_hide(state.floating.win)
	end
end)
