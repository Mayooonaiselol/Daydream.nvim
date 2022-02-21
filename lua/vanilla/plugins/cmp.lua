local _2afile_2a = "fnl/vanilla/plugins/cmp.fnl"
local _local_1_ = require("cmp")
local setup = _local_1_["setup"]
local mapping = _local_1_["mapping"]
local _local_2_ = _local_1_["config"]
local compare = _local_2_["compare"]
local disable = _local_2_["disable"]
local _local_3_ = _local_1_["SelectBehavior"]
local insert_behavior = _local_3_["Insert"]
local select_behavior = _local_3_["Select"]
local event = _local_1_["event"]
local types = require("cmp.types")
local under_compare = require("cmp-under-comparator")
local _local_4_ = table
local insert = _local_4_["insert"]
vim.g["copilot_no_tab_map"] = true
vim.g["copilot_assume_mapped"] = true
vim.g["copilot_tab_fallback"] = ""
vim.cmd("hi CmpItemAbbrMatch gui=bold guifg=#FAFAFA")
vim.cmd("hi CmpItemAbbrMatchFuzzy guifg=#FAFAFA")
vim.cmd("hi CmpItemAbbr guifg=#a8a8a8")
vim.cmd("hi CmpItemKindVariable guibg=NONE guifg=#be95ff")
vim.cmd("hi CmpItemKindInterface guibg=NONE guifg=#be95ff")
vim.cmd("hi CmpItemKindText guibg=NONE guifg=#be95ff")
vim.cmd("hi CmpItemKindFunction guibg=NONE guifg=#ff7eb6")
vim.cmd("hi CmpItemKindMethod guibg=NONE guifg=#ff7eb6")
vim.cmd("hi CmpItemKindKeyword guibg=NONE guifg=#33b1ff")
vim.cmd("hi CmpItemKindProperty guibg=NONE guifg=#33b1ff")
vim.cmd("hi CmpItemKindUnit guibg=NONE guifg=#33b1ff")
do end (vim.opt)["completeopt"] = {"menu", "menuone", "noselect"}
local function _5_(entry, vim_item)
  vim_item.menu = ({nvim_lsp = "lsp", Path = "pth", treesitter = "trs", copilot = "cop", conjure = "cj"})[entry.source.name]
  vim_item.kind = ({Text = "\239\157\190", Method = "\239\154\166", Function = "\239\158\148", Constructor = "\239\144\163", Field = "\239\176\160", Variable = "\239\148\170", Class = "\239\180\175", Interface = "\239\131\168", Module = "\239\146\135", Property = "\239\176\160", Unit = "\229\161\158", Value = "\239\162\159", Enum = "\239\133\157", Keyword = "\239\160\138", Snippet = "\239\145\143", Color = "\239\163\151", File = "\239\156\152", Reference = "\239\156\134", Folder = "\239\157\138", EnumMember = "\239\133\157", Constant = "\239\163\190", Struct = "\215\164\214\188", Event = "\239\131\167", Operator = "\239\154\148", TypeParameter = ""})[vim_item.kind]
  return vim_item
end
return setup({preselect = types.cmp.PreselectMode.None, formatting = {format = _5_}, mapping = {["<C-b>"] = mapping.scroll_docs(-4), ["<C-f>"] = mapping.scroll_docs(4), ["<C-space>"] = mapping.complete(), ["<C-e>"] = mapping.abort(), ["<up>"] = disable, ["<down>"] = disable, ["<Tab>"] = mapping(mapping.select_next_item({behavior = insert_behavior}), {"i", "s"}), ["<S-Tab>"] = mapping(mapping.select_prev_item({behavior = insert_behavior}), {"i", "s"}), ["<space>"] = mapping.confirm({select = false})}, sources = {{name = "nvim_lsp"}, {name = "conjure"}, {name = "copilot"}, {name = "path"}}})