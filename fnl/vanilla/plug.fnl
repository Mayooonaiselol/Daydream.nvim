(import-macros {: pack : use-plug! : rock : rock! : packer-setup!} :vanilla.macros)

(use-plug! :wbthomason/packer.nvim {:config! :packer})
(use-plug! :lewis6991/impatient.nvim)

(local lisp-ft [:fennel :clojure :lisp :racket :scheme])

;; lispy configs
(use-plug! :Olical/conjure
              {:branch :develop
               :ft lisp-ft
               :requires [(pack :gpanders/nvim-parinfer {:ft lisp-ft})
                          (if (= fennel_compiler :aniseed)
                              (do
                                (pack :Olical/aniseed {:branch :develop}))
                              (= fennel_compiler :hotpot)
                              (do
                                (pack :rktjmp/hotpot.nvim)))]})

(use-plug! :folke/which-key.nvim {:init :which-key})
(use-plug! :lukas-reineke/indent-blankline.nvim {:config! :indentline})
(use-plug! :numToStr/Comment.nvim {:init :Comment})
(use-plug! :windwp/nvim-autopairs {:init :nvim-autopairs})

(use-plug! :nvim-lualine/lualine.nvim {:config! :lualine})
(use-plug! :akinsho/bufferline.nvim {:config! :bufferline})

;; Telescope
(use-plug! :nvim-telescope/telescope.nvim {:config! :telescope
                                           :cmd :Telescope
                                           :requires [:nvim-lua/popup.nvim
                                                      :nvim-lua/plenary.nvim]})
(use-plug! :nvim-telescope/telescope-file-browser.nvim {:requires :nvim-telescope/telescope.nvim})

(use-plug! :hrsh7th/nvim-cmp
              {:config! :cmp
               :requires [(pack :PaterJason/cmp-conjure {:after :conjure})
                          (pack :hrsh7th/cmp-nvim-lsp {:after :nvim-cmp})
                          (pack :hrsh7th/cmp-path {:after :nvim-cmp})
                          (pack :saadparwaiz1/cmp_luasnip {:after :nvim-cmp})
                          (pack :hrsh7th/cmp-buffer {:after :nvim-cmp})
                          (pack :hrsh7th/cmp-cmdline {:after :nvim-cmp})]})

(use-plug! :neovim/nvim-lspconfig
              {:config! :lspconf
               :requires [:williamboman/nvim-lsp-installer
                          (pack :j-hui/fidget.nvim {:after :nvim-lspconfig :init :fidget})]})

(use-plug! :nvim-treesitter/nvim-treesitter {:config! :treesitter})
(use-plug! :RRethy/nvim-base16 {:config! :base16})
(use-plug! :Pocco81/TrueZen.nvim {:cmd :TZAtaraxis
                                  :config! :truezen})
(use-plug! :norcalli/nvim-colorizer.lua {:config! :nvcolorizer})
(use-plug! :L3MON4D3/LuaSnip)
(use-plug! :rafamadriz/friendly-snippets)

(use-plug! :nvim-neorg/neorg
              {:config! :neorg
               :ft :norg
               :after :nvim-treesitter})

(use-plug! :rcarriga/nvim-notify {:config! :notify})

;; Git stuff
(use-plug! :lewis6991/gitsigns.nvim {:after :nvim-treesitter
                                     :config! :gitsigns})

(packer-setup!)
