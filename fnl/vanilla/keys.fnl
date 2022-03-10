(module vanilla.keys
  {autoload {a aniseed.core
             nvim aniseed.nvim
             wk which-key
             treesitter-selection nvim-treesitter.incremental_selection
             lspactions lspactions}})

(import-macros {: map-
                : ino-
                : im-
                : vno-
                : vm-
                : tno-
                : tm-
                : cno-
                : cm-
                : nno-
                : nm-
                : xm-
                : xno-} :vanilla.macros)

(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader " ")

;; (utils.keymap :n :K "<Nop>")
;; (utils.keymap :v :K "<Nop>")
;; (set vim.g.AutoPairsShortcutBackInsert "<M-b>")

;; Easier command line mode
(nno- ";" ":")
(vno- ";" ":")

;; Easy movement between splits
(nno- "<C-h>" "<C-w>h")
(nno- "<C-j>" "<C-w>j")
(nno- "<C-k>" "<C-w>k")
(nno- "<C-l>" "<C-w>l")

;; Easy resizing splits
(nno- "<C-Up>" ":resize +2<CR>")
(nno- "<C-Down>" ":resize -2<CR>")
(nno- "<C-Left>" ":vertical resize -2<CR>")
(nno- "<C-Right>" ":vertical resize +2<CR>")

;; Switching buffers
(nno- "<S-l>" ":bnext<CR>")
(nno- "<S-h>" ":bprevious<CR>")

;; Easy escape
(ino- "jk" "<esc>")
(cno- "jk" "<c-c>")
(nno- "<esc>" "<esc><cmd>noh<CR>")

(nno- "<leader>w" ":set wrap!<CR>")

;; Move text up and down
(vno- "<A-j>" ":m .+1<CR>==")
(vno- "<A-k>" ":m .-2<CR>==")

;; Stay in indent mode
(vno- "<" "<gv")
(vno- ">" ">gv")

;; Visual block, Move text up and down
(xno- "J" ":move '>+1<CR>gv-gv")
(xno- "K" ":move '<-2<CR>gv-gv")
(xno- "<A-j>" ":move '>+1<CR>gv-gv")
(xno- "<A-k>" ":move '<-2<CR>gv-gv")

;; Better terminal navigation
(tno- "<C-h>" "<C-\\><C-N><C-w>h")
(tno- "<C-j>" "<C-\\><C-N><C-w>j")
(tno- "<C-k>" "<C-\\><C-N><C-w>k")
(tno- "<C-l>" "<C-\\><C-N><C-w>l")

;; Telescope
(nno- "<leader>b" ":Telescope buffers<CR>")
(nno- "<leader>ff" ":Telescope current_buffer_fuzzy_find<CR>")
(nno- "<leader>:" ":Telescope commands<CR>")
(nno- "<leader><space>" ":Telescope find_files<CR>")
(nno- "<leader>fb" ":Telescope file_browser<CR>")
(nno- "<leader>so" ":Telescope diagnostics<CR>")
(nno- "<leader>sop" ":Telescope treesitter<CR>")

;; Truezen with Twilight!
(nno- "<leader>z" ":TZAtaraxis<CR> :Twilight<CR>")

;; LSP keybinds
(nno- "<leader>e" "<cmd>lua vim.diagnostic.open_float()<CR>")
(nno- "<leader>[" "<cmd>lua vim.diagnostic.goto_prev()<CR>")
(nno- "<leader>]" "<cmd>lua vim.diagnostic.goto_next()<CR>")
(nno- "<leader>q" "<cmd>lua vim.diagnostic.setloclist()<CR>")

(nno- "gD" "<cmd>lua vim.lsp.buf.declaration()<CR>" :buffer)
(nno- "gd" "<cmd>lua vim.lsp.buf.definition()<CR>" :buffer)
(nno- "K" "<cmd>lua vim.lsp.buf.hover()<CR>" :buffer)
(nno- "gi" "<cmd>lua vim.lsp.buf.implementation()<CR>" :buffer)
(nno- "<C-k>" "<cmd>lua vim.lsp.buf.signature_help()<CR>" :buffer)
(nno- "<space>wa" "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>" :buffer)
(nno- "<space>wr" "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>" :buffer)
(nno- "<space>wl" "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>" :buffer)
(nno- "<space>D" "<cmd>lua vim.lsp.buf.type_definition()<CR>" :buffer)
(nno- "<space>rn" "<cmd>lua vim.lsp.buf.rename()<CR>" :buffer)
(nno- "<space>ca" "<cmd>lua vim.lsp.buf.code_action()<CR>" :buffer)
(nno- "gr" "<cmd>lua vim.lsp.buf.references()<CR>" :buffer)
(nno- "<space>f" "<cmd>lua vim.lsp.buf.formatting()<CR>" :buffer)

;; (nno- "<up>" "<nop>")
;; (nno- "<down>" "<nop>")
;; (nno- "<left>" "<nop>")
;; (nno- "<right>" "<nop>")
