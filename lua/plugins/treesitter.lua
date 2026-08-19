return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			require("nvim-treesitter").setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})

			require("nvim-treesitter").install(require("languages.tools").treesitter_parsers())

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					pcall(vim.treesitter.start, args.buf)
				end,
			})

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					local ok = pcall(vim.treesitter.get_parser, args.buf)
					if ok then
						vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
			local ts_move = require("nvim-treesitter-textobjects.move")
			-- Helper function to set motion keymaps across normal, visual, and pending modes
			local function map_move(keys, fn, query)
				vim.keymap.set({ "n", "x", "o" }, keys, function()
					fn(query, "textobjects")
				end)
			end

			-- Function
			-- next start
			map_move("]f", ts_move.goto_next_start, "@function.outer")
			map_move("]p", ts_move.goto_next_start, "@parameter.inner")
			-- prev start
			map_move("[f", ts_move.goto_previous_start, "@function.outer")
			map_move("[p", ts_move.goto_previous_start, "@parameter.inner")

			-- Function call
			-- next start
			map_move("]F", ts_move.goto_next_start, "@call.outer")
			-- prev start
			map_move("[F", ts_move.goto_previous_start, "@call.outer")

			-- Return
			-- next start
			map_move("]r", ts_move.goto_next_start, "@return.outer")
			-- prev start
			map_move("[r", ts_move.goto_previous_start, "@return.outer")

			-- IF/FOR
			-- next start
			map_move("]o", ts_move.goto_next_start, { "@conditional.outer", "@loop.outer" })
			-- prev start
			map_move("[o", ts_move.goto_previous_start, { "@conditional.outer", "@loop.outer" })

			-- entry
			map_move("]e", ts_move.goto_next_start, "@entry.outer")
			map_move("[e", ts_move.goto_previous_start, "@entry.outer")

			-- assignment
			map_move("]=", ts_move.goto_next_start, "@assignment.outer")
			map_move("[=", ts_move.goto_previous_start, "@assignment.outer")

			--class
			map_move("]c", ts_move.goto_next_start, "@class.outer")
			map_move("[c", ts_move.goto_previous_start, "@class.outer")
		end,
	},
}
