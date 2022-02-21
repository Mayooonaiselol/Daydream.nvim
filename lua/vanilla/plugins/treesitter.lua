local _2afile_2a = "fnl/vanilla/plugins/treesitter.fnl"
local _local_1_ = require("nvim-treesitter.configs")
local setup = _local_1_["setup"]
return setup({ensure_installed = {"lua", "fennel"}, highlight = {enable = true, use_languagetree = true}, indent = {enable = true}, rainbow = {enable = true, extended_mode = true, max_file_lines = 1000, colors = {"#878d96", "#a8a8a8", "#8d8d8d", "#a2a9b0", "#8f8b8b", "#ada8a8"}}})