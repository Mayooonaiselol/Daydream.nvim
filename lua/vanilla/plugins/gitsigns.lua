local _2afile_2a = ".config/nvim/fnl/vanilla/plugins/gitsigns.fnl"
local _2amodule_name_2a = "vanilla.plugins.gitsigns"
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
local gitsigns, utils = autoload("gitsigns"), autoload("vanilla.utils")
do end (_2amodule_locals_2a)["gitsigns"] = gitsigns
_2amodule_locals_2a["utils"] = utils
gitsigns.setup({signs = {add = {text = "\226\150\141"}, change = {text = "\226\150\141"}, delete = {text = "\226\150\141"}, topdelete = {text = "\226\150\141"}, changedelete = {text = "\226\150\141"}}, keymaps = {noremap = true, buffer = true}, current_line_blame = false, update_debounce = 100})
return _2amodule_2a