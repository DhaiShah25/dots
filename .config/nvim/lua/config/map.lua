local keymap = vim.keymap

keymap.set("n", "<space>w", "<cmd>up<cr>")

keymap.set("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

keymap.set("x", "<leader>p", [["_dP]])

keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

keymap.set({ "n", "v" }, "<leader>d", '"_d')

keymap.set("n", "<space>E", vim.diagnostic.open_float)
keymap.set("n", "[d", vim.diagnostic.goto_prev)
keymap.set("n", "]d", vim.diagnostic.goto_next)

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }
		keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		keymap.set("n", "<space>gr", vim.lsp.buf.rename, opts)
		keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		keymap.set("n", "<leader>i", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
		end)
	end,
})
