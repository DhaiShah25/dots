local function get_transparency()
	if vim.g.neovide then
		return false
	end
	return true
end

vim.print(get_transparency())

return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			styles = {
				transparency = get_transparency(),
			},
		})
		vim.cmd("colorscheme rose-pine")
	end,
}
