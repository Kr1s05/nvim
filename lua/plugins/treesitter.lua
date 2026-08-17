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
			local ts_select = require("nvim-treesitter-textobjects.select").select_textobject
			-- Helper function to set motion keymaps across normal, visual, and pending modes
			local function map_move(keys, fn, query)
				vim.keymap.set({ "n", "x", "o" }, keys, function()
					fn(query, "textobjects")
				end)
			end

			local function map_select(keys, query)
				vim.keymap.set({ "x", "o" }, keys, function()
					ts_select(query, "textobjects")
				end)
			end
			-- Function
			-- select
			map_select("af", "@function.outer") -- whole function definition
			map_select("if", "@function.inner") -- function body
			map_select("p", "@parameter.inner") -- function parameter
			-- next start
			map_move("]af", ts_move.goto_next_start, "@function.outer")
			map_move("]if", ts_move.goto_next_start, "@function.inner")
			map_move("]p", ts_move.goto_next_start, "@parameter.inner")
			-- prev start
			map_move("[af", ts_move.goto_previous_start, "@function.outer")
			map_move("[if", ts_move.goto_previous_start, "@function.inner")
			map_move("[p", ts_move.goto_previous_start, "@parameter.inner")

			-- Function call
			-- select
			map_select("ac", "@call.outer")
			map_select("ic", "@call.inner")
			-- next start
			map_move("]ac", ts_move.goto_next_start, "@call.outer")
			map_move("]ic", ts_move.goto_next_start, "@call.inner")
			-- prev start
			map_move("[ac", ts_move.goto_previous_start, "@call.outer")
			map_move("[ic", ts_move.goto_previous_start, "@call.inner")

			-- Return
			-- select
			map_select("ar", "@return.outer")
			map_select("ir", "@return.inner")
			-- next start
			map_move("]ar", ts_move.goto_next_start, "@return.outer")
			map_move("]ir", ts_move.goto_next_start, "@return.inner")
			-- prev start
			map_move("[ar", ts_move.goto_previous_start, "@return.outer")
			map_move("[ir", ts_move.goto_previous_start, "@return.inner")

			-- IF/FOR
			-- select
			map_select("ao", { "@conditional.outer", "@loop.outer" }) -- whole function definition
			map_select("io", { "@conditional.inner", "@loop.inner" }) -- function body
			-- next start
			map_move("]ao", ts_move.goto_next_start, { "@conditional.outer", "@loop.outer" })
			map_move("]io", ts_move.goto_next_start, { "@conditional.inner", "@loop.inner" })
			-- prev start
			map_move("[ao", ts_move.goto_previous_start, { "@conditional.outer", "@loop.outer" })
			map_move("[io", ts_move.goto_previous_start, { "@conditional.inner", "@loop.inner" })

			-- entry
			map_select("e", "@entry.inner")
			map_move("]e", ts_move.goto_next_start, "@entry.inner")
			map_move("[e", ts_move.goto_previous_start, "@entry.inner")

			-- assignment
			map_select("=", "@assignment.outer")
			map_move("]=", ts_move.goto_next_start, "@assignment.outer")
			map_move("[=", ts_move.goto_previous_start, "@assignment.outer")

			-- Next Start (])
			-- map_select("c", "@class.outer") -- whole function definition
			-- map_move("]c", ts_move.goto_next_start, "@class.outer")
			-- map_move("[c", ts_move.goto_previous_start, "@class.outer")
		end,
	},
}
