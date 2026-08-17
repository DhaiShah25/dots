return {
	"gh:norcalli/nvim-colorizer.lua",
	data = {
		setup = function()
			require("colorizer").setup({
				"*",
				css = { css = true },
			})
		end,
	},
}
