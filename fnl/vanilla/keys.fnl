(import-macros {: let! : noremap! : buf-noremap!} :vanilla.macros)

;; the noremap! macro is used for any mappings. It has the following syntax:
;; (noremap! [<mode>] :key1 :commandtorun)
;; e.g. (noremap! [i] :jk :<esc>) binds jk to <esc> in insert mode
;; the buf-noremap! macro is used for buffer-local mappings, like those needed for LSP

;; leader keys
(let! mapleader " ")
(let! maplocalleader " ")

;; Easier command line mode
(noremap! [nv] ";" ":")

;; jk for escape
(noremap! [i] :jk :<esc>)

;; no highlight on escape
(noremap! [n] "<esc>" "<esc><cmd>noh<CR>")

;; wrap/unwrap
(noremap! [n] "<leader>w" ":set wrap!<CR>")

;; Telescope
(noremap! [n] "<leader>b" ":Telescope buffers<CR>")
(noremap! [n] "<leader>ff" ":Telescope current_buffer_fuzzy_find<CR>")
(noremap! [n] "<leader>:" ":Telescope commands<CR>")
(noremap! [n] "<leader><space>" ":Telescope find_files<CR>")
(noremap! [n] "<leader>so" ":Telescope diagnostics<CR>")
(noremap! [n] "<leader>sop" ":Telescope treesitter<CR>")

;; treesitter
(noremap! [n] :<Leader>th ":TSHighlightCapturesUnderCursor<CR>")
(noremap! [n] :<Leader>tp ":TSPlayground<CR>")

;; Truezen
(noremap! [n] "<leader>z" ":TZAtaraxis<CR>")

;; LSP keybinds, you may want to edit these, or uncomment the below lines to use them

;; (noremap! [n] "<leader>e" "<cmd>lua vim.diagnostic.open_float()<CR>")
;; (noremap! [n] "<leader>[" "<cmd>lua vim.diagnostic.goto_prev()<CR>")
;; (noremap! [n] "<leader>]" "<cmd>lua vim.diagnostic.goto_next()<CR>")
;; (noremap! [n] "<leader>q" "<cmd>lua vim.diagnostic.setloclist()<CR>")
;;
;; (buf-noremap! [n] "gD" "<cmd>lua vim.lsp.buf.declaration()<CR>")
;; (buf-noremap! [n] "gd" "<cmd>lua vim.lsp.buf.definition()<CR>")
;; (buf-noremap! [n] "K" "<cmd>lua vim.lsp.buf.hover()<CR>")
;; (buf-noremap! [n] "gi" "<cmd>lua vim.lsp.buf.implementation()<CR>")
;; (buf-noremap! [n] "<C-k>" "<cmd>lua vim.lsp.buf.signature_help()<CR>")
;; (buf-noremap! [n] "<space>wa" "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
;; (buf-noremap! [n] "<space>wr" "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
;; (buf-noremap! [n] "<space>wl" "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
;; (buf-noremap! [n] "<space>D" "<cmd>lua vim.lsp.buf.type_definition()<CR>")
;; (buf-noremap! [n] "<space>rn" "<cmd>lua vim.lsp.buf.rename()<CR>")
;; (buf-noremap! [n] "<space>ca" "<cmd>lua vim.lsp.buf.code_action()<CR>")
;; (buf-noremap! [n] "gr" "<cmd>lua vim.lsp.buf.references()<CR>")
;; (buf-noremap! [n] "<space>f" "<cmd>lua vim.lsp.buf.formatting()<CR>")

;; ony need these if hotpot is active
(if (= fennel_compiler :hotpot)
    (do
      (noremap! [v] :<leader>e
                "<cmd>lua print(require('hotpot.api.eval')['eval-selection']())<CR>")
      (noremap! [v] :<leader>c
                "<cmd>lua print(require('hotpot.api.compile')['compile-selection']())<CR>")
      (noremap! [n] :<leader>c
                "<cmd>lua print(require('hotpot.api.compile')['compile-buffer'](0))<CR>")))
