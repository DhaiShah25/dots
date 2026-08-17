return {
	"gh:everviolet/nvim.git",
	name = "evergarden",
	data = {
		setup = function()
			vim.opt.termguicolors = true
			require("evergarden").setup({
				theme = {
					variant = "fall",
					accent = "blue",
				},
				editor = {
					transparent_background = true,
				},
			})
			if vim.g.neovide then
				vim.g.neovide_scroll_animation_length = 0.1
				vim.g.neovide_opacity = 0.8
			end
			vim.cmd.colorscheme("evergarden")
		end,
	},
}
