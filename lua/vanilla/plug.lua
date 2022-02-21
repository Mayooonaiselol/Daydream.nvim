local _2afile_2a = "fnl/vanilla/plug.fnl"
local function _1_()
  use({"wbthomason/packer.nvim"})
  use({"lewis6991/impatient.nvim"})
  use({branch = "develop", ft = __fnl_global__lisp_2dft, requires = {{ft = __fnl_global__lisp_2dft, "gpanders/nvim-parinfer"}, {branch = "develop", "Olical/aniseed"}}, "Olical/conjure"})
  use({config = "require('which-key').setup()", "folke/which-key.nvim"})
  use({after = "telescope-fzf-native.nvim", config = "require('vanilla.plugins.telescope')", requires = {{cmd = "Telescope", "nvim-lua/popup.nvim"}, {after = "popup.nvim", "nvim-lua/plenary.nvim"}, {after = "telescope-fzf-native.nvim", requires = {"tami5/sqlite.lua"}, "nvim-telescope/telescope-frecency.nvim"}, {after = "plenary.nvim", run = "make", "nvim-telescope/telescope-fzf-native.nvim"}}, "nvim-telescope/telescope.nvim"})
  use({after = "cmp-under-comparator", config = "require('vanilla.plugins.cmp')", requires = {{after = "nvim-cmp", "hrsh7th/cmp-nvim-lsp"}, {after = "nvim-cmp", "PaterJason/cmp-conjure"}, {after = "nvim-cmp", "hrsh7th/cmp-path"}, {after = "nvim-cmp", "hrsh7th/cmp-copilot"}, {after = "nvim-cmp", "hrsh7th/cmp-calc"}, {after = "nvim-cmp", "saadparwaiz1/cmp_luasnip"}, {event = "InsertCharPre", "github/copilot.vim"}, {event = "InsertCharPre", "lukas-reineke/cmp-under-comparator"}}, "hrsh7th/nvim-cmp"})
  use({config = "require('vanilla.plugins.lspconf')", requires = "williamboman/nvim-lsp-installer", "neovim/nvim-lspconfig"})
  use({requires = "neovim/nvim-lspconfig", "simrat39/symbols-outline.nvim"})
  use({"weilbith/nvim-code-action-menu"})
  use({"kosayoda/nvim-lightbulb"})
  use({"akinsho/toggleterm.nvim"})
  local function _2_()
    vim.g.did_load_filetypes = 1
    return nil
  end
  use({config = _2_, "nathom/filetype.nvim"})
  local function _3_()
    local _local_4_ = require("trouble")
    local setup = _local_4_["setup"]
    return setup({icons = false})
  end
  use({cmd = "Trouble", config = _3_, "folke/trouble.nvim"})
  use({config = "require('vanilla.plugins.treesitter')", requires = {{after = "nvim-treesitter", "p00f/nvim-ts-rainbow"}}, "nvim-treesitter/nvim-treesitter"})
  use({config = "require('vanilla.plugins.base16')", "RRethy/nvim-base16"})
  use({cmd = "TZAtaraxis", config = "require('vanilla.plugins.truezen')", "Pocco81/TrueZen.nvim"})
  use({requires = "Pocco81/TrueZen.nvim", "folke/twilight.nvim"})
  use({config = "require('vanilla.plugins.nvcolorizer')", "norcalli/nvim-colorizer.lua"})
  use({"L3MON4D3/LuaSnip"})
  use({"rafamadriz/friendly-snippets"})
  use({after = "nvim-treesitter", config = "require('vanilla.plugins.neorg')", "nvim-neorg/neorg"})
  local function _5_()
    return (require("dapui")).setup()
  end
  use({config = _5_, opt = false, requires = {"mfussenegger/nvim-dap"}, "rcarriga/nvim-dap-ui"})
  use({opt = false, "mfussenegger/nvim-dap"})
  use({requires = {"mfussenegger/nvim-dap", "nvim-telescope/telescope.nvim"}, "nvim-telescope/telescope-dap.nvim"})
  use({"tpope/vim-fugitive"})
  use({cmd = {"DiffviewOpen", "DiffviewToggleFiles"}, config = "require('vanilla.plugins.diffview')", "sindrets/diffview.nvim"})
  return use({after = "nvim-treesitter", opt = false, "lewis6991/gitsigns.nvim"})
end
return (require("packer")).startup(_1_)