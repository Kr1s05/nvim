return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		require("lualine").setup({
			options = {
				globalstatus = true, -- this is what makes it global — sets laststatus=3 for you
				icons_enabled = true,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = { { "filename", path = 1 }, { "searchcount" } },
				lualine_x = { "diagnostics" },
				lualine_y = { "filetype" },
				lualine_z = { "location" },
			},
		})
	end,
}
