return {
	"saghen/blink.cmp",
	version = "1.*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		signature = { enabled = false },
		completion = {
			list = {
				selection = {
					preselect = true,
					auto_insert = false,
				},
				cycle = { from_top = true, from_bottom = true },
			},
			menu = {
				border = "rounded",
				draw = {
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind" },
					},
				},
			},
			documentation = {
				auto_show = false,
				window = { border = "rounded" },
			},
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
		keymap = {
			preset = "none",
			["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
			["<Up>"] = false,
			["<Down>"] = false,
			["<CR>"] = { "accept", "fallback" },
			["<C-Tab>"] = { "show" },
		},
	},
}
