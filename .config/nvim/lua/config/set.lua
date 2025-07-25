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

vim.o.termguicolors = true

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.o.cursorline = true

vim.o.confirm = true

vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)
