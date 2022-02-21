local _2afile_2a = "fnl/vanilla/plugins/toggleterm.fnl"
local _local_1_ = require("toggleterm")
local setup = _local_1_["setup"]
return setup({size = 20, hide_numbers = true, start_in_insert = true, insert_mappings = true, terminal_mappings = true, persist_size = true, close_on_exit = true, shell = vim.o.shell, float_opts = {border = "shadow", width = 1, height = 1, winblend = 3, highlights = {border = "Normal", background = "Normal"}}})