return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		animate = {
			enabled = true,
		},
		picker = {
			sources = {
				explorer = {
					auto_close = true,
				},
			},
			actions = {
				confirm_pick = function(picker, item)
					if item and item.dir then
						picker:action("confirm")
					else
						picker:action("pick_win")
						picker:action("confirm")
					end
				end,
			},

			win = {
				input = {
					keys = {
						["<CR>"] = { "confirm_pick", mode = { "i", "n" } },
					},
				},
				list = {
					keys = {
						["<CR>"] = "confirm_pick",
					},
				},
			},
		},
		statuscolumn = {
			enabled = true,
		},
		indent = {
			enabled = true,
		},
		explorer = {
			enabled = true,
		},
	},
	keys = {
		{
			"<leader>bd",
			function()
				Snacks.bufdelete()
			end,
			desc = "Delete buffer",
		},
		-- Files and grep
		{
			"<leader>fe",
			function()
				Snacks.explorer()
			end,
			desc = "File explorer",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Find Buffers",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep / Live Grep",
		},
		{
			"<leader>fw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Grep Current Word",
			mode = { "n", "x" },
		},
	},
	init = function()
		-- Hybrid line numbers
		vim.opt.number = true
		vim.opt.relativenumber = true

		-- 2. LSP-Attached Snacks Pickers
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf }
				local map = vim.keymap.set

				-- LSP Navigation using Snacks.picker
				map("n", "gd", function()
					Snacks.picker.lsp_definitions()
				end, { buffer = ev.buf, desc = "Goto Definition" })
				map("n", "gr", function()
					Snacks.picker.lsp_references()
				end, { buffer = ev.buf, desc = "Goto References" })
				map("n", "gI", function()
					Snacks.picker.lsp_implementations()
				end, { buffer = ev.buf, desc = "Goto Implementation" })
				map("n", "gy", function()
					Snacks.picker.lsp_type_definitions()
				end, { buffer = ev.buf, desc = "Goto Type Definition" })
				map("n", "<leader>ss", function()
					Snacks.picker.lsp_symbols()
				end, { buffer = ev.buf, desc = "Document Symbols" })
				map("n", "<leader>sS", function()
					Snacks.picker.lsp_workspace_symbols()
				end, { buffer = ev.buf, desc = "Workspace Symbols" })

				--------------------------------------------------
				-- Built-in LSP Actions (Standard vim.lsp functions)
				--------------------------------------------------
				map("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "Hover Documentation" })
				map("n", "<leader>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename Symbol" })
				vim.keymap.set({ "n", "x" }, "<leader>ca", function()
					require("tiny-code-action").code_action()
				end, { noremap = true, silent = true })
				-- Diagnostics using Snacks.picker
				--------------------------------------------------
				map("n", "<leader>ld", function()
					Snacks.picker.diagnostics_buffer()
				end, { buffer = ev.buf, desc = "Buffer Diagnostics" })
				map("n", "<leader>lD", function()
					Snacks.picker.diagnostics()
				end, { buffer = ev.buf, desc = "Workspace Diagnostics" })
			end,
		})
	end,
}
