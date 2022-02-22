local _2afile_2a = ".config/nvim/fnl/vanilla/plugins/truezen.fnl"
local _local_1_ = require("true-zen")
local setup = _local_1_["setup"]
return setup({ui = {bottom = {cmdheight = 1, laststatus = 0, ruler = true, showmode = false, showcmd = false}, left = {number = false, relativenumber = false, signcolumn = "no"}}, modes = {ataraxis = {left_padding = 32, right_padding = 32, top_padding = 1, bottom_padding = 1, ideal_writing_area_width = {0}, auto_padding = false, bg_configuration = true}, focus = {margin_of_error = 5, focus_method = "experimental"}}})