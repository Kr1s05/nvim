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
		local gen_spec = require("mini.ai").gen_spec
		require("mini.ai").setup({
			custom_textobjects = {
				-- Functions / methods
				f = gen_spec.treesitter({
					a = "@function.outer",
					i = "@function.inner",
				}),

				-- Parameters
				p = gen_spec.treesitter({
					a = "@parameter.outer",
					i = "@parameter.inner",
				}),

				-- Function / method calls
				F = gen_spec.treesitter({
					a = "@call.outer",
					i = "@call.inner",
				}),

				-- Returns
				r = gen_spec.treesitter({
					a = "@return.outer",
					i = "@return.inner",
				}),

				-- Conditionals
				c = gen_spec.treesitter({
					a = "@conditional.outer",
					i = "@conditional.inner",
				}),

				-- Loops
				l = gen_spec.treesitter({
					a = "@loop.outer",
					i = "@loop.inner",
				}),

				-- Assignments / declarations
				["="] = gen_spec.treesitter({
					a = "@assignment.outer",
					i = "@assignment.rhs",
				}),

				-- Object / JSON / TS type entries
				e = gen_spec.treesitter({
					a = "@entry.outer",
					i = "@entry.inner",
				}),

				-- Classes
				C = gen_spec.treesitter({
					a = "@class.outer",
					i = "@class.inner",
				}),
			},
		})
	end,
}
