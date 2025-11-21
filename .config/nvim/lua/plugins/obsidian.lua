return {
	"obsidian-nvim/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	keys = {
		{ "<leader>nn", "<cmd>Obsidian new<cr>" },
		{ "<leader>nq", "<cmd>Obsidian quick_switch<cr>" },
		{ "<leader>ns", "<cmd>Obsidian search<cr>" },
	},
	opts = {
		workspaces = {
			{
				name = "work",
				path = "~/vault",
			},
		},
		frontmatter = { enabled = false },

		legacy_commands = false,
	},
}
