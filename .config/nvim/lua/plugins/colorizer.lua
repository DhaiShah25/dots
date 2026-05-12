return {
	"gh:norcalli/nvim-colorizer.lua",
	setup = function()
		require("colorizer").setup({
			"*",
			css = { css = true },
		})
	end,
}
