return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.surround").setup({})
		require("mini.move").setup({
			mappings = {
				-- Move current line or selection in Normal and Visual modes
				left = "<A-h>",
				right = "<A-l>",
				down = "<A-j>",
				up = "<A-k>",

				-- Move current line in Normal mode
				line_left = "<A-h>",
				line_right = "<A-l>",
				line_down = "<A-j>",
				line_up = "<A-k>",
			},
		})
		require("mini.comment").setup({})
	end,
}
