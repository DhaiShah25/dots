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
