(import-macros {: set! : cmd : augroup : autocmd} :vanilla.macros)

;; This is going to be your introduction to the let! and set! macros
;; let! is used for vim.g. options. For example, (let! do_filetype_lua 1) expands to vim.g["do_filetype_lua"]=1.
;; set! is used for vim.opt options. For example, (set! mouse :a) expands to vim.opt["mouse"]="a"
;; if a string or number isn't passed to set!, it will assume true. e.g. (set! list) will expand to vim.opt["list"]=true
;; Similarly if the option starts with no, it will assume false e.g. (set! noru) will expand to vim.opt["ru"]=false

;; e.g. font for GUI's. You probably want to change this
;; (set! guifont "Liga SFMono Nerd Font:h15")

(let [built-ins [:netrw
                 :netrwPlugin
                 :netrwSettings
                 :netrwFileHandlers
                 :gzip
                 :zip
                 :zipPlugin
                 :tar
                 :tarPlugin
                 :getscript
                 :getscriptPlugin
                 :vimball
                 :vimballPlugin
                 :2html_plugin
                 :logipat
                 :rrhelper
                 :spellfile_plugin
                 :matchit]
      providers [:perl :python :python3 :node :ruby]]
  (each [_ v (ipairs built-ins)]
    (let [b (.. :loaded_ v)]
      (tset vim.g b 1)))
  (each [_ v (ipairs providers)]
    (let [p (.. :loaded_ v :_provider)]
      (tset vim.g p 0))))

;; Generic Neovim configuration.
(set! noru)
(set! list)
(set! mouse :a)
(set! number)
(set! termguicolors)
(set! undofile)
(set! noswapfile)
(set! nowritebackup)
(set! smartcase)
(set! tabstop 2)
(set! expandtab)
(set! shiftwidth 0)
(set! lazyredraw)
(set! scrolloff 3)
(set! updatetime 500)
(set! fillchars {:vert " "
                 :eob " "})
(set! signcolumn "auto:1-9")
(set! clipboard :unnamedplus)

;; statusline setting if you dont want lualine
;; (set! statusline "%F%m%r%h%w: %2l")

(set! incsearch)
(set! expandtab)
(set! hlsearch)
(set! nowrap)
(set! noautoindent)
(set! shiftwidth 2)
(set! softtabstop 2)
(set! cursorline)

;; no line numbers in terminal
(augroup terminalSettings
         (autocmd TermOpen "term://*" "setlocal nonumber norelativenumber signcolumn=no | setfiletype terminal"))

;; highlight on yank
(augroup highlightOnYank
         (autocmd TextYankPost * "silent! lua vim.highlight.on_yank()"))
