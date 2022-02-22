local _2afile_2a = ".config/nvim/fnl/vanilla/keys.fnl"
local _2amodule_name_2a = "vanilla.keys"
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
local a, lspactions, nvim, treesitter_selection, utils, wk = autoload("aniseed.core"), autoload("lspactions"), autoload("aniseed.nvim"), autoload("nvim-treesitter.incremental_selection"), autoload("vanilla.utils"), autoload("which-key")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["lspactions"] = lspactions
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["treesitter-selection"] = treesitter_selection
_2amodule_locals_2a["utils"] = utils
_2amodule_locals_2a["wk"] = wk
nvim.g.mapleader = " "
nvim.g.maplocalleader = " "
utils.keymap("n", ";", ":")
utils.keymap("v", ";", ":")
utils.keymap("n", "<C-h>", "<C-w>h", {})
utils.keymap("n", "<C-j>", "<C-w>j", {})
utils.keymap("n", "<C-k>", "<C-w>k", {})
utils.keymap("n", "<C-l>", "<C-w>l", {})
utils.keymap("n", "<C-Up>", ":resize +2<CR>", {})
utils.keymap("n", "<C-Down>", ":resize -2<CR>", {})
utils.keymap("n", "<C-Left>", ":vertical resize -2<CR>", {})
utils.keymap("n", "<C-Right>", ":vertical resize +2<CR>", {})
utils.keymap("n", "<S-l>", "bnext<CR>", {})
utils.keymap("n", "<S-h>", "bprevious<CR>", {})
utils.keymap("i", "jk", "<esc>")
utils.keymap("c", "jk", "<c-c>")
utils.keymap("t", "jk", "<c-\\><c-n>")
utils.keymap("n", "<esc>", "<esc><cmd>noh<cr>")
utils.keymap("n", "<leader>w", ":set wrap!<CR>")
utils.keymap("v", "<A-j>", ":m .+1<CR>==", {})
utils.keymap("v", "<A-k>", ":m .-2<CR>==", {})
utils.keymap("v", "<", "<gv", {})
utils.keymap("v", ">", ">gv", {})
utils.keymap("x", "J", ":move '>+1<CR>gv-gv", {})
utils.keymap("x", "K", ":move '<-2<CR>gv-gv", {})
utils.keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", {})
utils.keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", {})
utils.keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", {})
utils.keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", {})
utils.keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", {})
utils.keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", {})
utils.keymap("n", "<leader>b", ":Telescope buffers<CR>")
utils.keymap("n", "<leader>ff", ":Telescope current_buffer_fuzzy_find<CR>")
utils.keymap("n", "<leader>fr", ":Telescope frecency<CR>")
utils.keymap("n", "<leader>:", ":Telescope commands<CR>")
utils.keymap("n", "<leader><space>", ":Telescope find_files<CR>")
utils.keymap("n", "<leader>so", ":lua require('telescope.builtin').lsp_document_symbols()<CR>")
utils.keymap("n", "<leader>z", ":TZAtaraxis<CR> :Twilight<CR>")
utils.keymap("n", "<leader>xx", "TroubleToggle<cr>", {})
utils.keymap("n", "<leader>xw", ":TroubleToggle workspace_diagnostics<cr>", {})
utils.keymap("n", "<leader>xd", ":TroubleToggle document_diagnostics<cr>", {})
utils.keymap("n", "<leader>xq", ":TroubleToggle quickfix<cr>", {})
utils.keymap("n", "<leader>xl", ":TroubleToggle loclist<cr>", {})
utils.keymap("n", "<leader>xlp", ":TroubleToggle lsp_references<cr>", {})
utils.keymap("n", "<A-t>", "ToggleTerm<CR>")
return _2amodule_2a