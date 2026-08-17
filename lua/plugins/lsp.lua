return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- Only load on Lua files
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
				-- Load snacks.nvim types so Snacks.picker is recognized
				{ path = "snacks.nvim", words = { "Snacks" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		opts = {},
	},
	{
		"rachartier/tiny-code-action.nvim",
		event = "LspAttach",
		opts = {
			backend = "delta",
			picker = "snacks",
			backend_opts = {
				delta = {
					header_lines_to_remove = 4,
					-- If you have a custom configuration file, you can set the path to it like so:
					-- args = {
					--     "--config" .. os.getenv("HOME") .. "/.config/delta/config.yml",
					-- }
					args = {
						"--line-numbers",
					},
				},
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = require("languages.tools").mason_lsp(),
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
}
