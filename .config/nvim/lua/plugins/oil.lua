return {
	"gh:stevearc/oil.nvim",
	data = {
		setup = function()
			require("oil").setup({ view_options = {
				show_hidden = true,
			} })
		end,
	},
}
