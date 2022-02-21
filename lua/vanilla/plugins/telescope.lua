local _2afile_2a = "fnl/vanilla/plugins/telescope.fnl"
local _local_1_ = require("telescope")
local setup = _local_1_["setup"]
local ffi = require("ffi")
setup({defaults = {borderchars = {" ", " ", " ", " ", " ", " ", " ", " "}, prompt_prefix = " \239\128\130  ", selection_caret = "  ", entry_prefix = "  ", sorting_strategy = "ascending", layout_strategy = "horizontal", layout_config = {horizontal = {prompt_position = "top", preview_width = 0.55, results_width = 0.8}, vertical = {mirror = false}, width = 0.87, height = 0.8, preview_cutoff = 120}, use_less = true, set_env = {COLORTERM = "truecolor"}, dynamic_preview_title = true}})
do end (require("telescope")).load_extension("fzf")
if ffi.load("libsqlite3") then
  return (require("telescope")).load_extension("frecency")
else
  return nil
end