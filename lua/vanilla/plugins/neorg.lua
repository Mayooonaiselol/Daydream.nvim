local _2afile_2a = "fnl/vanilla/plugins/neorg.fnl"
local _local_1_ = require("neorg")
local setup = _local_1_["setup"]
setup({load = {["core.defaults"] = {}, ["core.norg.concealer"] = {}, ["core.norg.qol.toc"] = {}, ["core.norg.completion"] = {config = {engine = "nvim-cmp"}}, ["core.norg.dirman"] = {config = {workspaces = {main = "~/org/neorg"}, autodetect = true, autochdir = true}}}})
local parser_config = (require("nvim-treesitter.parsers")).get_parser_configs()
parser_config.norg_meta = {install_info = {url = "https://github.com/nvim-neorg/tree-sitter-norg-meta", files = {"src/parser.c"}, branch = "main"}}
parser_config.norg_table = {install_info = {url = "https://github.com/nvim-neorg/tree-sitter-norg-table", files = {"src/parser.c"}, branch = "main"}}
return nil