return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = require("languages.tools").linters_by_ft()
	end,
}
