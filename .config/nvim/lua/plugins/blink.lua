return {
	"gh:saghen/blink.cmp",
	setup = function()
		require("blink.cmp").setup({
			completion = { documentation = { auto_show = true } },
		})
	end,
}
