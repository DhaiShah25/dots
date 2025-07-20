return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.enable("ruff")
		vim.lsp.enable("rust_analyzer")
		vim.lsp.enable("ts_ls")
	end,
}
