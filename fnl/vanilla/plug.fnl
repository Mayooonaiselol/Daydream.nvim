(import-macros {: pack : use-package! : rock : rock! : unpack!} :vanilla.macros)

(use-package! :wbthomason/packer.nvim {:config! :packer})
(use-package! :lewis6991/impatient.nvim)

(use-package! :Olical/conjure
              {:branch :develop
               :ft lisp-ft
               :requires [(pack :gpanders/nvim-parinfer {:ft lisp-ft})
                          (pack :Olical/aniseed {:branch :develop})]})

(use-package! :folke/which-key.nvim {:init :which-key})
(use-package! :nvim-lua/plenary.nvim)
(use-package! :nvim-lua/popup.nvim)

(use-package! :nvim-telescope/telescope.nvim
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

(use-package! :hrsh7th/nvim-cmp
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

(use-package! :neovim/nvim-lspconfig
              {:config! :lspconf
               :requires :williamboman/nvim-lsp-installer})
(use-package! :ray-x/lsp_signature.nvim {:events [:BufEnter]})
(use-package! :glepnir/lspsaga.nvim {:requires :neovim/nvim-lspconfig})
(use-package! :simrat39/symbols-outline.nvim {:requires :neovim/nvim-lspconfig})
(use-package! :weilbith/nvim-code-action-menu)
(use-package! :akinsho/toggleterm.nvim)
(use-package! :nathom/filetype.nvim {:config (set vim.g.did_load_filetypes 1)})

(use-package! :folke/trouble.nvim
              {:cmd :Trouble
               :config (fn []
                         (local {: setup} (require :trouble))
                         (setup {:icons false}))})

(use-package! :nvim-treesitter/nvim-treesitter
              {:config! :treesitter
               :requires [(pack :p00f/nvim-ts-rainbow {:after :nvim-treesitter})]})

(use-package! :RRethy/nvim-base16 {:config! :base16})
(use-package! :Pocco81/TrueZen.nvim {:cmd :TZAtaraxis
                                     :config! :truezen})
(use-package! :folke/twilight.nvim {:requires :Pocco81/TrueZen.nvim})
(use-package! :norcalli/nvim-colorizer.lua {:config! :nvcolorizer})
(use-package! :L3MON4D3/LuaSnip)
(use-package! :rafamadriz/friendly-snippets)

(use-package! :nvim-neorg/neorg
              {:config! :neorg
               :after :nvim-treesitter})

(use-package! :rcarriga/nvim-dap-ui {:opt false 
                                     :config #((. (require :dapui) :setup))
                                     :requires [:mfussenegger/nvim-dap]})

(use-package! :mfussenegger/nvim-dap {:opt false})
(use-package! :nvim-telescope/telescope-dap.nvim {:requires [:mfussenegger/nvim-dap
                                                             :nvim-telescope/telescope.nvim]})

(use-package! :tpope/vim-fugitive)
(use-package! :sindrets/diffview.nvim {:cmd ["DiffviewOpen" "DiffviewToggleFiles"]
                                         :config! :diffview})
(use-package! :lewis6991/gitsigns.nvim {:after :nvim-treesitter
                                        :config! :gitsigns})
(use-package! :rhysd/conflict-marker.vim)
;; (use-package! :TimUntersberger/neogit)

(use-package! :godlygeek/tabular)
(use-package! :mg979/vim-visual-multi)
(use-package! :tpope/vim-surround)

(unpack!)
