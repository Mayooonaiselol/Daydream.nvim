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

(use-plug! :nvim-lualine/lualine.nvim {:config! :lualine})
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
(use-plug! :ray-x/lsp_signature.nvim {:events [:BufEnter]})
(use-plug! :glepnir/lspsaga.nvim {:requires :neovim/nvim-lspconfig})
(use-plug! :simrat39/symbols-outline.nvim {:requires :neovim/nvim-lspconfig})
(use-plug! :weilbith/nvim-code-action-menu)
(use-plug! :akinsho/toggleterm.nvim)
(use-plug! :nathom/filetype.nvim {:config! :filetype})

(use-plug! :folke/trouble.nvim
              {:cmd :Trouble
               :config (fn []
                         (local {: setup} (require :trouble))
                         (setup {:icons false}))})

(use-plug! :nvim-treesitter/nvim-treesitter
              {:config! :treesitter
               :requires [(pack :p00f/nvim-ts-rainbow {:after :nvim-treesitter})]})

(use-plug! :RRethy/nvim-base16 {:config! :base16})
(use-plug! :Pocco81/TrueZen.nvim {:cmd :TZAtaraxis
                                  :config! :truezen})
(use-plug! :folke/twilight.nvim {:requires :Pocco81/TrueZen.nvim})
(use-plug! :norcalli/nvim-colorizer.lua {:config! :nvcolorizer})
(use-plug! :L3MON4D3/LuaSnip)
(use-plug! :rafamadriz/friendly-snippets)

(use-plug! :nvim-neorg/neorg
              {:config! :neorg
               :after :nvim-treesitter})

(use-plug! :rcarriga/nvim-dap-ui {:opt false 
                                  :config #((. (require :dapui) :setup))
                                  :requires [:mfussenegger/nvim-dap]})

(use-plug! :mfussenegger/nvim-dap {:opt false})
(use-plug! :nvim-telescope/telescope-dap.nvim {:requires [:mfussenegger/nvim-dap
                                                          :nvim-telescope/telescope.nvim]})

(use-plug! :tpope/vim-fugitive)
(use-plug! :sindrets/diffview.nvim {:cmd ["DiffviewOpen" "DiffviewToggleFiles"]
                                      :config! :diffview})
(use-plug! :lewis6991/gitsigns.nvim {:after :nvim-treesitter
                                     :config! :gitsigns})
(use-plug! :rhysd/conflict-marker.vim)
(use-plug! :TimUntersberger/neogit)

(use-plug! :godlygeek/tabular)
(use-plug! :mg979/vim-visual-multi)
(use-plug! :tpope/vim-surround)

;; gotta showoff
(use-plug! :andweeb/presence.nvim)

(packer-setup!)
