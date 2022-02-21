local _2afile_2a = "plugins/nvim-treesitter.fnl"
local _local_1_ = require("nvim-treesitter.configs")
local setup = _local_1_["setup"]
return setup({ensure_installed = {"lua", "fennel"}, highlight = {enable = true, use_languagetree = true, disable = {"org"}, additional_vim_regex_highlighting = {"org"}}, indent = {enable = true}})