local nvim_treesitter_timur = {}

function nvim_treesitter_timur.setup(opts)
	local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
	parser_config.timur = {
		install_info = {
			url = "https://github.com/kibertod/nvim-treesitter-timur",
			files = { "src/parser.c" },
			branch = "master",
		},
		filetype = "tmr",
	}
	vim.filetype.add({
		extension = {
			tmr = "tmr",
		},
	})
	vim.treesitter.language.register("timur", "tmr")
end

_G.nvim_treesitter_timur = nvim_treesitter_timur
return _G.nvim_treesitter_timur
