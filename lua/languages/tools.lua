local languages = require("languages.list")

local M = {}

function M.formatters_by_ft()
	local result = {}
	for _, lang in pairs(languages) do
		for _, ft in ipairs(lang.filetypes) do
			result[ft] = lang.formatter
		end
	end
	return result
end

function M.linters_by_ft()
	local result = {}
	for _, lang in pairs(languages) do
		for _, ft in ipairs(lang.filetypes) do
			if #lang.linter > 0 then
				result[ft] = lang.linter
			end
		end
	end
	return result
end

function M.treesitter_parsers()
	local set = {}
	for _, lang in pairs(languages) do
		for _, p in ipairs(lang.parser) do
			set[p] = true
		end
	end
	return vim.tbl_keys(set)
end

function M.mason_lsp()
	local set = {}
	for _, lang in pairs(languages) do
		for _, p in ipairs(lang.lsp) do
			set[p] = true
		end
	end
	return vim.tbl_keys(set)
end

return M
