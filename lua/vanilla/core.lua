local _2afile_2a = "fnl/vanilla/core.fnl"
local _2amodule_name_2a = "vanilla.core"
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
local nvim = autoload("aniseed.nvim")
do end (_2amodule_locals_2a)["nvim"] = nvim
do
  local built_ins = {"netrw", "netrwPlugin", "netrwSettings", "netrwFileHandlers", "gzip", "zip", "zipPlugin", "tar", "tarPlugin", "getscript", "getscriptPlugin", "vimball", "vimballPlugin", "2html_plugin", "logipat", "rrhelper", "spellfile_plugin", "matchit"}
  local providers = {"perl", "python", "python3", "node", "ruby"}
  for _, v in ipairs(built_ins) do
    local b = ("loaded_" .. v)
    do end (vim.g)[b] = 1
  end
  for _, v in ipairs(providers) do
    local p = ("loaded_" .. v .. "_provider")
    do end (vim.g)[p] = 0
  end
end
vim.opt["ru"] = false
vim.opt["list"] = true
vim.opt["mouse"] = "a"
vim.opt["number"] = true
vim.opt["termguicolors"] = true
vim.opt["undofile"] = true
vim.opt["swapfile"] = false
vim.opt["writebackup"] = false
vim.opt["smartcase"] = true
vim.opt["tabstop"] = 2
vim.opt["expandtab"] = true
vim.opt["shiftwidth"] = 0
vim.opt["lazyredraw"] = true
vim.opt["scrolloff"] = 3
vim.opt["updatetime"] = 500
vim.opt["fillchars"] = "eob: "
vim.opt["signcolumn"] = "auto:1-9"
vim.opt["clipboard"] = "unnamedplus"
vim.opt["statusline"] = "%F%m%r%h%w: %2l"
vim.opt["incsearch"] = true
vim.opt["expandtab"] = true
vim.opt["hlsearch"] = true
vim.opt["wrap"] = false
vim.opt["autoindent"] = false
vim.opt["shiftwidth"] = 2
vim.opt["softtabstop"] = 2
return _2amodule_2a