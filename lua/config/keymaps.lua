-- Diagnostics
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Prev diagnostic" })
-- Scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Insert newline below current line without moving cursor
vim.keymap.set("n", "<CR>", function()
	local line = vim.fn.line(".")
	vim.api.nvim_buf_set_lines(0, line, line, false, { "" })
end, { desc = "Insert newline below (stay on current line)" })

-- Insert newline above current line without moving cursor
vim.keymap.set("n", "<S-CR>", function()
	local line = vim.fn.line(".")
	vim.api.nvim_buf_set_lines(0, line - 1, line - 1, false, { "" })
end, { desc = "Insert newline above (stay on current line)" })
-- Split window vertically
vim.keymap.set("n", "<leader>-w-s", "<cmd>vsplit<cr>", {
	desc = "Vertical split",
})
-- Next window
vim.keymap.set("n", "<leader>w", "<C-w>w", {
	desc = "Next window",
})
