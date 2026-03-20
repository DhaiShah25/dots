return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.enable("ruff")
		vim.lsp.enable("rust_analyzer")
		vim.lsp.enable("ts_ls")
		vim.lsp.enable("emmet_language_server")
		vim.lsp.enable("slangd")
		vim.lsp.enable("qmlls")
		vim.lsp.enable("harper_ls")
		vim.lsp.enable("markdown_oxide")
		vim.lsp.enable("slint_lsp")
		vim.lsp.enable("zls")
		vim.lsp.enable("ols")
		vim.lsp.enable("nixd")
	end,
}
