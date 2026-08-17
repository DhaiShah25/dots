return {
	"gh:nvim-mini/mini.nvim",
	data = {
		setup = function()
			require("mini.comment").setup()
			require("mini.move").setup()
			require("mini.icons").setup()
			require("mini.statusline").setup()
			require("mini.indentscope").setup()
			require("mini.git").setup()
			require("mini.notify").setup()
			require("mini.completion").setup({})
			require("mini.diff").setup({})

			require("mini.sessions").setup({})

			require("mini.starter").setup({ evaluate_single = true })

			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "snacks_picker_input" },
				callback = function(args)
					vim.b[args.buf].minicompletion_disable = true
				end,
			})
		end,
	},
}
