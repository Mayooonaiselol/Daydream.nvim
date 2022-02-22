local _2afile_2a = ".config/nvim/fnl/vanilla/plugins/lspconf.fnl"
local _2amodule_name_2a = "vanilla.plugins.lspconf"
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
local a, lsp, str = autoload("aniseed.core"), autoload("lspconfig"), autoload("aniseed.string")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["lsp"] = lsp
_2amodule_locals_2a["str"] = str
local config = require("lspconfig")
do
  local _let_1_ = vim.diagnostic
  local config0 = _let_1_["config"]
  local severity = _let_1_["severity"]
  local _let_2_ = vim.fn
  local sign_define = _let_2_["sign_define"]
  config0({underline = {severity = {min = severity.INFO}}, signs = {severity = {min = severity.INFO}}, virtual_text = {severity = {min = severity.INFO}}, update_in_insert = false, severity_sort = true, float = {show_header = false, border = "single"}})
  sign_define("DiagnosticSignError", {text = "\239\145\167", texthl = "DiagnosticSignError"})
  sign_define("DiagnosticSignWarn", {text = "\239\148\169", texthl = "DiagnosticSignWarn"})
  sign_define("DiagnosticSignInfo", {text = "\239\145\137", texthl = "DiagnosticSignInfo"})
  sign_define("DiagnosticSignHint", {text = "\239\160\181", texthl = "DiagnosticSignHint"})
end
local function init_lsp(lsp_name, _3fopts)
  local merged_opts = a.merge({on_attach = on_attach, capabilities = __fnl_global__default_2dcapabilities}, (_3fopts or {}))
  return lsp[lsp_name].setup(merged_opts)
end
do
  local sumneko_root_path = (vim.env.HOME .. "/.local/share/nvim/lsp_servers/sumneko_lua")
  local sumneko_binary = (sumneko_root_path .. "/extension/server/bin/lua-language-server")
  init_lsp("sumneko_lua", {cmd = {sumneko_binary, "-E", (sumneko_root_path .. "/main.lua")}, settings = {Lua = {runtime = {version = "LuaJIT", path = vim.split(package.path, ";")}, diagnostics = {globals = {"vim"}}, workspace = {library = {[vim.fn.expand("$VIMRUNTIME/lua")] = true, [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true}}, telemetry = false}}})
end
do
  local _let_3_ = vim.lsp
  local with = _let_3_["with"]
  local handlers = _let_3_["handlers"]
  vim.lsp.handlers["textDocument/signatureHelp"] = with(handlers.signature_help, {border = "single"})
  vim.lsp.handlers["textDocument/hover"] = with(handlers.hover, {border = "single"})
end
local lsp_installer = require("nvim-lsp-installer")
local function _4_(server)
  local opts = {}
  opts.capabilities = (require("cmp_nvim_lsp")).update_capabilities(vim.lsp.protocol.make_client_capabilities())
  return server:setup(opts)
end
lsp_installer.on_server_ready(_4_)
return _2amodule_2a