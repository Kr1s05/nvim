return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = require("languages.tools").formatters_by_ft(),
		format_on_save = {
			timeout_ms = 1000,
			lsp_format = "fallback", -- use LSP formatting only if no formatter is configured for the filetype
		},
	},
}
