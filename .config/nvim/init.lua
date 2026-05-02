vim.loader.enable()
require("config.set")
require("config.map")
require("config.floaterm")
require("config.note")
require("config.plugins")
require("config.lsp")

require("vim._core.ui2").enable({})

vim.filetype.add({
	extension = {
		dj = "djot",
		djot = "djot",
	},
})

-- Transparent colors w/ catppuccin
vim.cmd.colorscheme("catppuccin")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
