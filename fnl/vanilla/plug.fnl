(import-macros {: pack : use-plug! : rock : rock! : packer-setup!} :vanilla.macros)

;; There are some plugins we only want to load for lisps. Heres a list of lispy filetypes I use
(local lisp-ft [:fennel :clojure :lisp :racket :scheme])

(use-plug! :wbthomason/packer.nvim {:config! :packer})
(use-plug! :lewis6991/impatient.nvim)

(use-plug! :Olical/conjure
              {:branch :develop
               :ft lisp-ft
               :requires (pack :Olical/aniseed {:branch :develop})})

(use-plug! :folke/which-key.nvim {:init :which-key})
(use-plug! :nvim-lua/plenary.nvim)
(use-plug! :nvim-lua/popup.nvim)
(use-plug! :lukas-reineke/indent-blankline.nvim {:config! :indentline})
(use-plug! :numToStr/Comment.nvim {:init :Comment})
(use-plug! :windwp/nvim-autopairs {:init :nvim-autopairs})

(use-plug! :nvim-lualine/lualine.nvim {:config! :lualine
                                       :requires :kyazdani42/nvim-web-devicons})
(use-plug! :akinsho/bufferline.nvim {:config! :bufferline})

;; Telescope
(use-plug! :nvim-telescope/telescope.nvim
              {:after :telescope-fzf-native.nvim
               :config! :telescope
               :requires [(pack :nvim-lua/popup.nvim
                                {:cmd :Telescope})
                          (pack :nvim-lua/plenary.nvim
                                {:after :popup.nvim})
                          (pack :nvim-telescope/telescope-fzf-native.nvim
                                {:run :make
                                 :after :plenary.nvim})]})
(use-plug! :nvim-telescope/telescope-file-browser.nvim {:requires :nvim-telescope/telescope.nvim})

(use-plug! :hrsh7th/nvim-cmp
              {:config! :cmp
               :requires [(pack :hrsh7th/cmp-nvim-lsp {:after :nvim-cmp})
                          (pack :PaterJason/cmp-conjure {:after :conjure})
                          (pack :hrsh7th/cmp-path {:after :nvim-cmp})
                          (pack :saadparwaiz1/cmp_luasnip {:after :nvim-cmp})
                          (pack :hrsh7th/cmp-buffer {:after :nvim-cmp})
                          :lukas-reineke/cmp-under-comparator]})

(use-plug! :neovim/nvim-lspconfig
              {:config! :lspconf
               :requires [:williamboman/nvim-lsp-installer
                          (pack :j-hui/fidget.nvim {:after :nvim-lspconfig :init :fidget})]})

(use-plug! :nvim-treesitter/nvim-treesitter {:config! :treesitter})
(use-plug! :RRethy/nvim-base16 {:config! :base16})
(use-plug! :Pocco81/TrueZen.nvim {:cmd :TZAtaraxis
                                  :config! :truezen})
(use-plug! :folke/twilight.nvim {:requires :Pocco81/TrueZen.nvim
                                 :cmd :Twilight})
(use-plug! :norcalli/nvim-colorizer.lua {:config! :nvcolorizer})
(use-plug! :L3MON4D3/LuaSnip)
(use-plug! :rafamadriz/friendly-snippets)

(use-plug! :nvim-neorg/neorg
              {:config! :neorg
               :ft :norg
               :after :nvim-treesitter})

(use-plug! :rcarriga/nvim-notify {:config! :notify})

;; Git stuff
(use-plug! :sindrets/diffview.nvim {:config! :diffview
                                    :cmd ["DiffviewOpen" "DiffviewToggleFiles"]})
(use-plug! :lewis6991/gitsigns.nvim {:after :nvim-treesitter
                                     :config! :gitsigns})

(use-plug! :godlygeek/tabular {:cmd :Tabularize})
(use-plug! :mg979/vim-visual-multi)

(packer-setup!)
