(module vanilla.keys
  {autoload {a aniseed.core
             nvim aniseed.nvim
             wk which-key
             treesitter-selection nvim-treesitter.incremental_selection
             lspactions lspactions}})

(import-macros {: noremap! : buf-noremap!} :vanilla.macros)

(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader " ")

;; (utils.keymap :n :K "<Nop>")
;; (utils.keymap :v :K "<Nop>")
;; (set vim.g.AutoPairsShortcutBackInsert "<M-b>")

;; Easier command line mode
(noremap! [nv] ";" ":")

;; Easy movement between splits
(noremap! [n] "<C-h>" "<C-w>h")
(noremap! [n] "<C-j>" "<C-w>j")
(noremap! [n] "<C-k>" "<C-w>k")
(noremap! [n] "<C-l>" "<C-w>l")

;; Easy resizing splits
(noremap! [n] "<C-Up>" ":resize +2<CR>")
(noremap! [n] "<C-Down>" ":resize -2<CR>")
(noremap! [n] "<C-Left>" ":vertical resize -2<CR>")
(noremap! [n] "<C-Right>" ":vertical resize +2<CR>")

;; Switching buffers
(noremap! [n] "<S-l>" ":bnext<CR>")
(noremap! [n] "<S-h>" ":bprevious<CR>")

;; Easy escape
(noremap! [i] "jk" "<esc>")
(noremap! [c] "jk" "<c-c>")
(noremap! [n] "<esc>" "<esc><cmd>noh<CR>")

(noremap! [n] "<leader>w" ":set wrap!<CR>")

;; Mremapve text up and down
(noremap! [v] "<A-j>" ":m .+1<CR>==")
(noremap! [v] "<A-k>" ":m .-2<CR>==")

;; Stay in indent mode
(noremap! [v] "<" "<gv")
(noremap! [v] ">" ">gv")

;; Visual block, Move text up and down
(noremap! [x] "J" ":move '>+1<CR>gv-gv")
(noremap! [x] "K" ":move '<-2<CR>gv-gv")
(noremap! [x] "<A-j>" ":move '>+1<CR>gv-gv")
(noremap! [x] "<A-k>" ":move '<-2<CR>gv-gv")

;; Better terminal navigation
(noremap! [t] "<C-h>" "<C-\\><C-N><C-w>h")
(noremap! [t] "<C-j>" "<C-\\><C-N><C-w>j")
(noremap! [t] "<C-k>" "<C-\\><C-N><C-w>k")
(noremap! [t] "<C-l>" "<C-\\><C-N><C-w>l")

;; Telescope
(noremap! [n] "<leader>b" ":Telescope buffers<CR>")
(noremap! [n] "<leader>ff" ":Telescope current_buffer_fuzzy_find<CR>")
(noremap! [n] "<leader>:" ":Telescope commands<CR>")
(noremap! [n] "<leader><space>" ":Telescope find_files<CR>")
(noremap! [n] "<leader>fb" ":Telescope file_browser<CR>")
(noremap! [n] "<leader>so" ":Telescope diagnostics<CR>")
(noremap! [n] "<leader>sop" ":Telescope treesitter<CR>")

;; Truezen!
(noremap! [n] "<leader>z" ":TZAtaraxis<CR>")

;; LSP keybinds
(noremap! [n] "<leader>e" "<cmd>lua vim.diagnostic.open_float()<CR>")
(noremap! [n] "<leader>[" "<cmd>lua vim.diagnostic.goto_prev()<CR>")
(noremap! [n] "<leader>]" "<cmd>lua vim.diagnostic.goto_next()<CR>")
(noremap! [n] "<leader>q" "<cmd>lua vim.diagnostic.setloclist()<CR>")

(buf-noremap! [n] "gD" "<cmd>lua vim.lsp.buf.declaration()<CR>")
(buf-noremap! [n] "gd" "<cmd>lua vim.lsp.buf.definition()<CR>")
(buf-noremap! [n] "K" "<cmd>lua vim.lsp.buf.hover()<CR>")
(buf-noremap! [n] "gi" "<cmd>lua vim.lsp.buf.implementation()<CR>")
(buf-noremap! [n] "<C-k>" "<cmd>lua vim.lsp.buf.signature_help()<CR>")
(buf-noremap! [n] "<space>wa" "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
(buf-noremap! [n] "<space>wr" "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
(buf-noremap! [n] "<space>wl" "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
(buf-noremap! [n] "<space>D" "<cmd>lua vim.lsp.buf.type_definition()<CR>")
(buf-noremap! [n] "<space>rn" "<cmd>lua vim.lsp.buf.rename()<CR>")
(buf-noremap! [n] "<space>ca" "<cmd>lua vim.lsp.buf.code_action()<CR>")
(buf-noremap! [n] "gr" "<cmd>lua vim.lsp.buf.references()<CR>")
(buf-noremap! [n] "<space>f" "<cmd>lua vim.lsp.buf.formatting()<CR>")

(noremap! [n] "<up>" "<nop>")
(noremap! [n] "<down>" "<nop>")
(noremap! [n] "<left>" "<nop>")
(noremap! [n] "<right>" "<nop>")
