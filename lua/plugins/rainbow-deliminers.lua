return {
	"HiPhish/rainbow-delimiters.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("rainbow-delimiters.setup").setup({
			strategy = { [""] = "rainbow-delimiters.strategy.global" },
			query = {
				[""] = "rainbow-delimiters",
				lua = "rainbow-blocks",
			},
		})
	end,
}
