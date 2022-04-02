(import-macros {: pack : use-plug! : rock : rock! : packer-setup!} :vanilla.macros)

;;; Emacs' use-package is not a package manager! Although use-package does have the useful capability to interface with package managers, its mainly for configuring and loading packages.
;;; Still, as packer.nvim is use-package inspired, lets just think of it as a vim-y version of straight-use-package for now

;;; The syntax is simple:
;;; (use-plug! <repo-name> {:keyword :arg ...} ...)
;;; Please refer to :h packer.nvim for more information. I trust the examples below are enough to get you started.

;;; One catch to the use-plug! macro: It doesn't obey whats around it, whatever package declaration you create gets directly added to the global vanilla/plug list. To work around this, we can add aniseed/hotpot as requirements for the conjure package, then use the pack macro to load them instead.
;;; You can use the pack macro to create package declarations within a use-plug! block.

;;; This config also introduces the init! keyword
;;; :init! is used to initialize any package which as the form require("<name>").setup
;;; e.g. (use-plug! :folke/which-key.nvim {:init :which-key}) expands to use({config = "require('which-key').setup()", "folke/which-key.nvim"})

;;; Some other notes about the package macros
;;; Packages can be added with use-plug! anywhere you please, as they are added to a global list. However, make sure to call packer-setup! after you have declared all the packages you need to install, as the configuration will ignore everything *after* packer-setup! is called.
;;; Similar to use-plug and pack, there are also the rock and rock! macros for declaring luarock dependencies. You won't see it used in this config by default. Feel free to use it yourself though.
;;; rock vs rock!: rock is to rock! as pack is to use-plug!

;;; for lazy loading, here is a quick reference of the events you should use.
;;; 1. BufRead (read the contexts of demo.txt into the new buffer)
;;; 2. InsertEnter (swap into Insert mode)
;;; 3. InsertCharPre (swap into Insert mode, right when you press the first input)
;;; you can also lazy load packages on commands (:cmd), filetypes (:ft), and after other plugins (:after).

;; Bootstrap essential plugins
(use-plug! :nvim-lua/popup.nvim)
(use-plug! :nvim-lua/plenary.nvim)
(use-plug! :wbthomason/packer.nvim {:config! :packer})
(use-plug! :lewis6991/impatient.nvim)

;; There are some plugins we only want to load for lisps. Heres a list of lispy filetypes
(local lisp-ft [:fennel :clojure :lisp :racket :scheme])

;; adding aniseed/hotpot (required for configuring neovim in fennel)
(use-plug! :Olical/conjure
           {:branch :develop
            :ft lisp-ft
            :requires [(if (= fennel_compiler :aniseed)
                         (do
                           (pack :Olical/aniseed {:branch :develop}))
                         (= fennel_compiler :hotpot)
                         (do
                           (pack :rktjmp/hotpot.nvim)))]})

;; adding our stuff from here
(use-plug! :folke/which-key.nvim {:init :which-key})
(use-plug! :lukas-reineke/indent-blankline.nvim {:config! :indentline :event :BufRead})
(use-plug! :numToStr/Comment.nvim {:init :Comment})
(use-plug! :windwp/nvim-autopairs {:init :nvim-autopairs})

;; if you dont like a statusline, you can remove it and uncomment the statusline setting in core.fnl for a clean look without lualine
(use-plug! :nvim-lualine/lualine.nvim {:config! :lualine})
(use-plug! :akinsho/bufferline.nvim {:config! :bufferline})

;; will be removed after neovim-0.7.x released, would no longer be required
(use-plug! :nathom/filetype.nvim)

;; Telescope
(use-plug! :nvim-telescope/telescope.nvim
           {:after :telescope-fzf-native.nvim
            :config! :telescope
            :cmd :Telescope
            :requires [(pack :nvim-telescope/telescope-fzf-native.nvim
                             {:run :make :after :plenary.nvim})]})

(use-plug! :nvim-treesitter/nvim-treesitter {:config! :treesitter
                                             :requires (pack :nvim-treesitter/playground {:cmd :TSPlayground})})

;; lsp
(use-plug! :neovim/nvim-lspconfig
           {:config! :lspconf
            :requires [:williamboman/nvim-lsp-installer
                       (pack :j-hui/fidget.nvim {:after :nvim-lspconfig :init :fidget})]})

;; completions
(use-plug! :hrsh7th/nvim-cmp
           {:event :InsertEnter
            :config! :cmp
            :requires [(pack :PaterJason/cmp-conjure {:after :conjure})
                       (pack :hrsh7th/cmp-nvim-lsp {:after :nvim-cmp})
                       (pack :hrsh7th/cmp-path {:after :nvim-cmp})
                       (pack :saadparwaiz1/cmp_luasnip {:after :nvim-cmp})
                       (pack :hrsh7th/cmp-buffer {:after :nvim-cmp})]})

;; snippets
(use-plug! :L3MON4D3/LuaSnip {:after :nvim-cmp
                              :requires (pack :rafamadriz/friendly-snippets {:after :luasnip})})

;; our beloved neovim aesthetics because why not
(use-plug! :RRethy/nvim-base16 {:config! :base16})
(use-plug! :Pocco81/TrueZen.nvim {:cmd :TZAtaraxis :config! :truezen})
(use-plug! :norcalli/nvim-colorizer.lua {:config! :nvcolorizer :event :BufRead})

(use-plug! :rcarriga/nvim-notify {:config (fn []
                                            (set vim.notify (require :notify))
                                            (local {: setup} (require :notify))
                                            (setup {:stages :slide
                                                    :timeout 4500
                                                    :minimum_width 50
                                                    :icons {:ERROR ""
                                                            :WARN ""
                                                            :INFO ""
                                                            :DEBUG ""
                                                            :TRACE "✎"}}))})

(use-plug! :folke/trouble.nvim
           {:cmd :TroubleToggle
            :config (fn []
                      (local {: setup} (require :trouble))
                      (setup {:icons false}))})

;; orgmode in neovim, uncomment the below lines if you want it

;; (use-plug! :nvim-neorg/neorg
;;            {:config! :neorg
;;             :ft :norg
;;             :after :nvim-treesitter})

;; Git stuff
(use-plug! :lewis6991/gitsigns.nvim {:after :nvim-treesitter :config! :gitsigns})

;; packer-setup! macro is called to initialize packer and pass each package to the packer.nvim plugin
(packer-setup!)
