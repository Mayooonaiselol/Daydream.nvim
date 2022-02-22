local _2afile_2a = ".config/nvim/fnl/vanilla/plugins/diffview.fnl"
local _2amodule_name_2a = "vanilla.plugins.diffview"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local autoload = (require("aniseed.autoload")).autoload
local cb, diffview = autoload("diffview.config"), autoload("diffview")
do end (_2amodule_locals_2a)["cb"] = cb
_2amodule_locals_2a["diffview"] = diffview
diffview.setup({diff_binaries = false, file_panel = {width = 35, use_icons = false}, key_bindings = {view = {["<leader>dn"] = cb.diffview_callback("select_next_entry"), ["<leader>dp"] = cb.diffview_callback("select_prev_entry"), ["<leader>dm"] = cb.diffview_callback("toggle_files")}}})
return _2amodule_2a