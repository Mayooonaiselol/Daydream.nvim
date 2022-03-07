(module vanilla.keys
  {autoload {a aniseed.core
             nvim aniseed.nvim
             utils vanilla.utils
             wk which-key
             treesitter-selection nvim-treesitter.incremental_selection
             lspactions lspactions}})

(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader " ")

;; Easier command line mode
(utils.keymap :n ";" ":")
(utils.keymap :v ";" ":")

;; Easy movement between splits
(utils.keymap :n :<C-h> :<C-w>h {})
(utils.keymap :n :<C-j> :<C-w>j {})
(utils.keymap :n :<C-k> :<C-w>k {})
(utils.keymap :n :<C-l> :<C-w>l {})

;; Easy resizing splits
(utils.keymap :n :<C-Up> ":resize +2<CR>" {})
(utils.keymap :n :<C-Down> ":resize -2<CR>" {})
(utils.keymap :n :<C-Left> ":vertical resize -2<CR>" {})
(utils.keymap :n :<C-Right> ":vertical resize +2<CR>" {})

;; Switching buffers
(utils.keymap :n :<S-l> :bnext<CR> {})
(utils.keymap :n :<S-h> :bprevious<CR> {})

(utils.keymap :i :jk :<esc>)
(utils.keymap :c :jk :<c-c>)
(utils.keymap :t :jk :<c-\><c-n>)
(utils.keymap :n :<esc> :<esc><cmd>noh<cr>)
(utils.keymap :n "<leader>w" ":set wrap!<CR>")

;; Move text up and down
(utils.keymap :v :<A-j> ":m .+1<CR>==" {})
(utils.keymap :v :<A-k> ":m .-2<CR>==" {})

;; Stay in indent mode
(utils.keymap :v "<" "<gv" {})
(utils.keymap :v ">" ">gv" {})

;; Visual block, Move text up and down
(utils.keymap "x" "J" ":move '>+1<CR>gv-gv" {})
(utils.keymap "x" "K" ":move '<-2<CR>gv-gv" {})
(utils.keymap "x" "<A-j>" ":move '>+1<CR>gv-gv" {})
(utils.keymap "x" "<A-k>" ":move '<-2<CR>gv-gv" {})

;; Better terminal navigation
(utils.keymap "t" "<C-h>" "<C-\\><C-N><C-w>h" {})
(utils.keymap "t" "<C-j>" "<C-\\><C-N><C-w>j" {})
(utils.keymap "t" "<C-k>" "<C-\\><C-N><C-w>k" {})
(utils.keymap "t" "<C-l>" "<C-\\><C-N><C-w>l" {})

;; Telescope
(utils.keymap :n :<leader>b ":Telescope buffers<CR>")
(utils.keymap :n :<leader>ff ":Telescope current_buffer_fuzzy_find<CR>")
(utils.keymap :n :<leader>: ":Telescope commands<CR>")
(utils.keymap :n :<leader><space> ":Telescope find_files<CR>")
(utils.keymap :n :<leader>fb ":Telescope file_browser<CR>")
(utils.keymap :n :<leader>so ":lua require'telescope.builtin'.diagnostics{}<CR>")
(utils.keymap :n :<leader>sop ":Telescope treesitter<CR>")

;; Truezen with Twilight!
(utils.keymap :n :<leader>z ":TZAtaraxis<CR> :Twilight<CR>")

(utils.keymap :n "<up>" "<nop>")
(utils.keymap :n "<down>" "<nop>")
(utils.keymap :n "<left>" "<nop>")
(utils.keymap :n "<right>" "<nop>")
