local _2afile_2a = ".config/nvim/fnl/vanilla/plugins/nvcolorizer.fnl"
local _2amodule_name_2a = "vanilla.plugins.nvcolorizer"
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
local colorizer = autoload("colorizer")
do end (_2amodule_locals_2a)["colorizer"] = colorizer
vim.opt["termguicolors"] = true
colorizer.setup({"*"}, {RGB = true, RRGGBB = true, names = true, RRGGBBAA = true, rgb_fn = true, hsl_fn = true, mode = "background"})
return _2amodule_2a