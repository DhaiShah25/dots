local state = {
	floating = {
		buf = -1,
		win = -1,
	},
}

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

local function is_buffer_empty(buf)
	if not vim.api.nvim_buf_is_loaded(buf) then
		return true
	end

	local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

	if #lines == 0 then
		return true
	elseif #lines == 1 and lines[1] == "" then
		return true
	end

	return false
end

vim.keymap.set("n", "<leader>td", function()
	if not vim.api.nvim_win_is_valid(state.floating.win) then
		state.floating = create_floating_window({ buf = state.floating.buf })
		if vim.bo[state.floating.buf].buftype ~= "markdown" then
			local name = vim.fs.root(0, { ".git", ".jj", ".pijul" }) .. "/TODO.md"
			buf = vim.cmd.edit(name)
			local curr_buf = vim.api.nvim_get_current_buf()
			if is_buffer_empty(curr_buf) then
				vim.api.nvim_feedkeys("I# TODO\n\n- [ ] ", "n", true)
			end
		end
	else
		vim.api.nvim_win_hide(state.floating.win)
	end
end)
