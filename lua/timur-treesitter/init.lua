local timur_treesitter = {}

function timur_treesitter.setup()
	local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
	parser_config.timur = {
		install_info = {
			url = "https://github.com/kibertod/timur-treesitter",
			files = { "src/parser.c" },
			branch = "master",
		},
		filetype = "tmr",
	}
end

_G.timur_treesitter = timur_treesitter
return _G.timur_treesitter
