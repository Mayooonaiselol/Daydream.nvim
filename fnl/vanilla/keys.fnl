(module vanilla.keys
  {autoload {a aniseed.core
             nvim aniseed.nvim
             wk which-key
             treesitter-selection nvim-treesitter.incremental_selection
             lspactions lspactions}})

(import-macros {: map
                : inoremap
                : imap
                : vnoremap
                : vmap
                : tnoremap
                : tmap
                : cnoremap
                : cmap
                : nnoremap
                : nmap
                : xnoremap
                : xmap} :vanilla.macros)

(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader " ")

;; (utils.keymap :n :K "<Nop>")
;; (utils.keymap :v :K "<Nop>")
;; (set vim.g.AutoPairsShortcutBackInsert "<M-b>")

;; Easier command line mode
(nnoremap ";" ":")
(vnoremap ";" ":")

;; Easy movement between splits
(nnoremap "<C-h>" "<C-w>h")
(nnoremap "<C-j>" "<C-w>j")
(nnoremap "<C-k>" "<C-w>k")
(nnoremap "<C-l>" "<C-w>l")

;; Easy resizing splits
(nnoremap "<C-Up>" ":resize +2<CR>")
(nnoremap "<C-Down>" ":resize -2<CR>")
(nnoremap "<C-Left>" ":vertical resize -2<CR>")
(nnoremap "<C-Right>" ":vertical resize +2<CR>")

;; Switching buffers
(nnoremap "<S-l>" ":bnext<CR>")
(nnoremap "<S-h>" ":bprevious<CR>")

;; Easy escape
(inoremap "jk" "<esc>")
(cnoremap "jk" "<c-c>")
(nnoremap "<esc>" "<esc><cmd>noh<CR>")

(nnoremap "<leader>w" ":set wrap!<CR>")

;; Mremapve text up and down
(vnoremap "<A-j>" ":m .+1<CR>==")
(vnoremap "<A-k>" ":m .-2<CR>==")

;; Stay in indent mode
(vnoremap "<" "<gv")
(vnoremap ">" ">gv")

;; Visual block, Move text up and down
(xnoremap "J" ":move '>+1<CR>gv-gv")
(xnoremap "K" ":move '<-2<CR>gv-gv")
(xnoremap "<A-j>" ":move '>+1<CR>gv-gv")
(xnoremap "<A-k>" ":move '<-2<CR>gv-gv")

;; Better terminal navigation
(tnoremap "<C-h>" "<C-\\><C-N><C-w>h")
(tnoremap "<C-j>" "<C-\\><C-N><C-w>j")
(tnoremap "<C-k>" "<C-\\><C-N><C-w>k")
(tnoremap "<C-l>" "<C-\\><C-N><C-w>l")

;; Telescope
(nnoremap "<leader>b" ":Telescope buffers<CR>")
(nnoremap "<leader>ff" ":Telescope current_buffer_fuzzy_find<CR>")
(nnoremap "<leader>:" ":Telescope commands<CR>")
(nnoremap "<leader><space>" ":Telescope find_files<CR>")
(nnoremap "<leader>fb" ":Telescope file_browser<CR>")
(nnoremap "<leader>so" ":Telescope diagnostics<CR>")
(nnoremap "<leader>sop" ":Telescope treesitter<CR>")

;; Truezen with Twilight!
(nnoremap "<leader>z" ":TZAtaraxis<CR> :Twilight<CR>")

;; LSP keybinds
(nnoremap "<leader>e" "<cmd>lua vim.diagnostic.open_float()<CR>")
(nnoremap "<leader>[" "<cmd>lua vim.diagnostic.goto_prev()<CR>")
(nnoremap "<leader>]" "<cmd>lua vim.diagnostic.goto_next()<CR>")
(nnoremap "<leader>q" "<cmd>lua vim.diagnostic.setloclist()<CR>")

(nnoremap "gD" "<cmd>lua vim.lsp.buf.declaration()<CR>" :buffer)
(nnoremap "gd" "<cmd>lua vim.lsp.buf.definition()<CR>" :buffer)
(nnoremap "K" "<cmd>lua vim.lsp.buf.hover()<CR>" :buffer)
(nnoremap "gi" "<cmd>lua vim.lsp.buf.implementation()<CR>" :buffer)
(nnoremap "<C-k>" "<cmd>lua vim.lsp.buf.signature_help()<CR>" :buffer)
(nnoremap "<space>wa" "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>" :buffer)
(nnoremap "<space>wr" "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>" :buffer)
(nnoremap "<space>wl" "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>" :buffer)
(nnoremap "<space>D" "<cmd>lua vim.lsp.buf.type_definition()<CR>" :buffer)
(nnoremap "<space>rn" "<cmd>lua vim.lsp.buf.rename()<CR>" :buffer)
(nnoremap "<space>ca" "<cmd>lua vim.lsp.buf.code_action()<CR>" :buffer)
(nnoremap "gr" "<cmd>lua vim.lsp.buf.references()<CR>" :buffer)
(nnoremap "<space>f" "<cmd>lua vim.lsp.buf.formatting()<CR>" :buffer)

;; (nno- "<up>" "<nop>")
;; (nno- "<down>" "<nop>")
;; (nno- "<left>" "<nop>")
;; (nno- "<right>" "<nop>")
