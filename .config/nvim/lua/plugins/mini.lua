return {
	"gh:nvim-mini/mini.nvim",
	setup = function()
		require("mini.comment").setup()
		require("mini.move").setup()
		require("mini.icons").setup()
		require("mini.statusline").setup()
		require("mini.indentscope").setup()
		require("mini.git").setup()
		require("mini.notify").setup()
	end,
}
