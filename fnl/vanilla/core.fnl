(module vanilla.core
  {autoload {nvim aniseed.nvim}})

(import-macros {: set!} :vanilla.macros)

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
(set! fillchars "eob: ")
(set! signcolumn "auto:1-9")
(set! clipboard :unnamedplus)
;; (set! statusline "%F%m%r%h%w: %2l")
(set! incsearch)
(set! expandtab)
(set! hlsearch)
(set! nowrap)
(set! noautoindent)
(set! shiftwidth 2)
(set! softtabstop 2)
(set! cursorline)
