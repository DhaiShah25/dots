return {
	"gh:otavioschwanck/arrow.nvim",
	setup = function()
		require("arrow").setup({
			show_icons = true,
			leader_key = ";",
			buffer_leader_key = "m",
		})
	end,
}
