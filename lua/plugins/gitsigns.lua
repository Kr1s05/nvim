return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = " " },
			topdelete = { text = "▔" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		-- Disable native sign column drawing if snacks handles statuscolumn completely
		signcolumn = true,
		numhl = false,
		linehl = false,
	},
}
