return {
	"nvim-mini/mini.nvim",
	version = false,
	specs = {
		{ "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
	},
	init = function()
		package.preload["nvim-web-devicons"] = function()
			require("mini.icons").mock("nvim-web-devicons")
			return package.loaded["nvim-web-devicons"]
		end
	end,
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
		require("mini.icons").setup({})
	end,
}
