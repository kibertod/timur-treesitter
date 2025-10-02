local timur = {}

function timur.setup(opts)
	local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
	parser_config.timur = {
		install_info = {
			url = "https://github.com/kibertod/timur-treesitter",
			files = { "parser/src/parser.c" },
			generate_requires_npm = true,
			requires_generate_from_grammar = true,
		},
		filetype = "tmr",
	}
end
