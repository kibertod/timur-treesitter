local M = {}

function M.setup(opts)
	opts = opts or {}
	config = vim.tbl_deep_extend("force", config, opts)

	-- Register the parser
	local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
	parser_config.your_language = {
		install_info = {
			url = "https://github.com/kibertod/timur-treesitter",
			files = { "parser/src/parser.c" },
			branch = "main",
			generate_requires_npm = true,
			requires_generate_from_grammar = true,
		},
		filetype = "tmr",
	}

	-- Setup treesitter
	require("nvim-treesitter.configs").setup(config)
end

return M
