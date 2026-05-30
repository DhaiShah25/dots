local set = vim.keymap.set

set("n", "<space>w", "<cmd>up<cr>")
set("n", "-", "<cmd>Oil<cr>")

set("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

set("x", "<leader>p", [["_dP]])

set({ "n", "v" }, "<leader>y", [["+y]])
set("n", "<leader>Y", [["+Y]])

set({ "n", "v" }, "<leader>d", '"_d')

set("n", "<space>E", vim.diagnostic.open_float)

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }
		set("n", "gD", vim.lsp.buf.declaration, opts)
		set("n", "gd", vim.lsp.buf.definition, opts)
		set("n", "gi", vim.lsp.buf.implementation, opts)
		set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		set("n", "<space>gr", vim.lsp.buf.rename, opts)
		set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		set("n", "<leader>i", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
		end)
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "<filetype>" },
	callback = function()
		vim.treesitter.start()
	end,
})
