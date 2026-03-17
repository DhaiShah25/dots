require("config.set")
require("config.lazy")
require("config.map")
require("config.note")
require("config.floaterm")
require("config.notes")

vim.filetype.add({
	extension = {
		dj = "djot",
		djot = "djot",
	},
})
