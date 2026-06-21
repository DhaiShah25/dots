vim.o.swapfile = false
vim.o.undofile = true

vim.o.scrolloff = 8

vim.o.breakindent = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true

vim.g.have_nerd_font = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.showmode = false
vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = "a"

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch = true

vim.o.termguicolors = true

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.o.cursorline = true

vim.o.confirm = true

vim.o.colorcolumn = "100"

vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 10

vim.o.shell = "nu"

-- Get the window id for a buffer
-- @param bufnr integer
local function buf_to_win(bufnr)
	local current_win = vim.fn.win_getid()

	-- Check if current window has the buffer
	if vim.fn.winbufnr(current_win) == bufnr then
		return current_win
	end

	-- Otherwise, find a visible window with this buffer
	local win_ids = vim.fn.win_findbuf(bufnr)
	local current_tabpage = vim.fn.tabpagenr()

	for _, win_id in ipairs(win_ids) do
		if vim.fn.win_id2tabwin(win_id)[1] == current_tabpage then
			return win_id
		end
	end

	return current_win
end

-- Split a string into multiple lines, each no longer than max_width
-- The split will only occur on spaces to preserve readability
-- @param str string
-- @param max_width integer
local function split_line(str, max_width)
	if #str <= max_width then
		return { str }
	end

	local lines = {}
	local current_line = ""

	for word in string.gmatch(str, "%S+") do
		-- If adding this word would exceed max_width
		if #current_line + #word + 1 > max_width then
			-- Add the current line to our results
			table.insert(lines, current_line)
			current_line = word
		else
			-- Add word to the current line with a space if needed
			if current_line ~= "" then
				current_line = current_line .. " " .. word
			else
				current_line = word
			end
		end
	end

	-- Don't forget the last line
	if current_line ~= "" then
		table.insert(lines, current_line)
	end

	return lines
end

---@param diagnostic vim.Diagnostic
local function virtual_lines_format(diagnostic)
	local win = buf_to_win(diagnostic.bufnr)
	local sign_column_width = vim.fn.getwininfo(win)[1].textoff
	local text_area_width = vim.api.nvim_win_get_width(win) - sign_column_width
	local center_width = 5
	local left_width = 1

	---@type string[]
	local lines = {}
	for msg_line in diagnostic.message:gmatch("([^\n]+)") do
		local max_width = text_area_width - diagnostic.col - center_width - left_width
		vim.list_extend(lines, split_line(msg_line, max_width))
	end

	return table.concat(lines, "\n")
end

-- Don't show virtual text on curresnt line since we'll show virtual_lines
---@param diagnostic vim.Diagnostic
local function virtual_text_format(diagnostic)
	if vim.fn.line(".") == diagnostic.lnum + 1 then
		return nil
	end

	return diagnostic.message
end

vim.diagnostic.config({
	virtual_text = { format = virtual_text_format, severity = { min = vim.diagnostic.severity.WARN } },
	virtual_lines = { format = virtual_lines_format, current_line = true },
	severity_sort = { reverse = false },
})

-- Re-draw diagnostics each line change to account for virtual_text changes

local last_line = vim.fn.line(".")

vim.api.nvim_create_autocmd({ "CursorMoved" }, {
	callback = function()
		local current_line = vim.fn.line(".")

		-- Check if the cursor has moved to a different line
		if current_line ~= last_line then
			vim.diagnostic.hide()
			vim.diagnostic.show()
		end

		-- Update the last_line variable
		last_line = current_line
	end,
})

-- Re-render diagnostics when the window is resized

vim.api.nvim_create_autocmd("VimResized", {
	callback = function()
		vim.diagnostic.hide()
		vim.diagnostic.show()
	end,
})
