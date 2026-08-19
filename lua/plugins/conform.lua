return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		notify_on_error = false,
		formatters_by_ft = require("languages.tools").formatters_by_ft(),
		format_on_save = {
			timeout_ms = 1000,
			lsp_format = "never", -- use LSP formatting only if no formatter is configured for the filetype
		},
	},
}
