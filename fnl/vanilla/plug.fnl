(import-macros {: pack : use-plug! : rock : rock! : packer-setup!} :vanilla.macros)

(use-plug! :wbthomason/packer.nvim {:config! :packer})
(use-plug! :lewis6991/impatient.nvim)

(use-plug! :Olical/conjure
              {:branch :develop
               :ft lisp-ft
               :requires [(pack :gpanders/nvim-parinfer {:ft lisp-ft})
                          (pack :Olical/aniseed {:branch :develop})]})

(use-plug! :folke/which-key.nvim {:init :which-key})
(use-plug! :nvim-lua/plenary.nvim)
(use-plug! :nvim-lua/popup.nvim)
(use-plug! :lukas-reineke/indent-blankline.nvim {:config! :indentline})
(use-plug! :windwp/nvim-autopairs {:config #((. (require :nvim-autopairs) :setup))})

(use-plug! :kyazdani42/nvim-tree.lua {:config! :nvtree})
(use-plug! :nvim-lualine/lualine.nvim {:config! :lualine
                                       :requires :kyazdani42/nvim-web-devicons})
(use-plug! :akinsho/bufferline.nvim {:config! :bufferline})
(use-plug! :nvim-telescope/telescope.nvim
              {:after :telescope-fzf-native.nvim
               :config! :telescope
               :requires [(pack :nvim-lua/popup.nvim
                                {:cmd :Telescope})
                          (pack :nvim-lua/plenary.nvim
                                {:after :popup.nvim})
                          (pack :nvim-telescope/telescope-frecency.nvim
                                {:requires :tami5/sqlite.lua
                                 :after :telescope-fzf-native.nvim})
                          (pack :nvim-telescope/telescope-fzf-native.nvim
                                {:run :make
                                 :after :plenary.nvim})]})

(use-plug! :hrsh7th/nvim-cmp
              {:after :cmp-under-comparator
               :config! :cmp
               :requires [(pack :hrsh7th/cmp-nvim-lsp {:after :nvim-cmp})
                          (pack :PaterJason/cmp-conjure {:after :nvim-cmp})
                          (pack :hrsh7th/cmp-path {:after :nvim-cmp})
                          (pack :hrsh7th/cmp-copilot {:after :nvim-cmp})
                          (pack :hrsh7th/cmp-calc {:after :nvim-cmp})
                          (pack :saadparwaiz1/cmp_luasnip {:after :nvim-cmp})
                          (pack :github/copilot.vim {:event :InsertCharPre})
                          (pack :lukas-reineke/cmp-under-comparator
                                {:event :InsertCharPre})]})

(use-plug! :neovim/nvim-lspconfig
              {:config! :lspconf
               :requires :williamboman/nvim-lsp-installer})

(use-plug! :glepnir/lspsaga.nvim {:requires :neovim/nvim-lspconfig})
;; (use-plug! :nathom/filetype.nvim {:config! :filetype})

(use-plug! :nvim-treesitter/nvim-treesitter {:config! :treesitter})
(use-plug! :RRethy/nvim-base16 {:config! :base16})
(use-plug! :Pocco81/TrueZen.nvim {:cmd :TZAtaraxis
                                  :config! :truezen})
(use-plug! :folke/twilight.nvim {:requires :Pocco81/TrueZen.nvim})
(use-plug! :norcalli/nvim-colorizer.lua {:config! :nvcolorizer})
(use-plug! :L3MON4D3/LuaSnip)
(use-plug! :rafamadriz/friendly-snippets)

(use-plug! :nvim-neorg/neorg
              {:config! :neorg
               :ft :norg
               :after :nvim-treesitter})

(use-plug! :tpope/vim-fugitive)
(use-plug! :sindrets/diffview.nvim {:cmd ["DiffviewOpen" "DiffviewToggleFiles"]
                                      :config! :diffview})
(use-plug! :lewis6991/gitsigns.nvim {:after :nvim-treesitter
                                     :config! :gitsigns})
(use-plug! :TimUntersberger/neogit)

;; TODO
;; (use-plug! :godlygeek/tabular)
;; (use-plug! :mg979/vim-visual-multi)
;; (use-plug! :tpope/vim-surround)

(packer-setup!)
