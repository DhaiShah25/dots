local keymap = vim.keymap

keymap.set("n", "<space>w", "<cmd>w<cr>")

keymap.set("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

keymap.set("x", "<leader>p", [["_dP]])

keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

keymap.set({ "n" }, "<leader>gr", function()
	vim.lsp.buf.rename()
end)

keymap.set({ "n", "v" }, "<leader>d", '"_d')
