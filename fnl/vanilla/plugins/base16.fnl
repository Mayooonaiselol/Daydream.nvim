(import-macros {: cmd} :vanilla.macros)
(local {: setup} (require :base16-colorscheme))

(setup {:base00 "#151515"
        :base01 "#1f1f1f"
        :base02 "#282828"
        :base03 "#3b3b3b"
        :base04 "#e8e3e3"
        :base05 "#e8e3e3"
        :base06 "#e8e3e3"
        :base07 "#e8e3e3"
        :base08 "#b66467"
        :base09 "#d9bc8c"
        :base0A "#d9bc8c"
        :base0B "#8c977d"
        :base0C "#8aa6a2"
        :base0D "#8da3b9"
        :base0E "#a988b0"
        :base0F "#747272"})

(vim.cmd "hi StatusLineNC gui=underline guibg=#151515 guifg=#3b3b3b")
(vim.cmd "hi StatusLine gui=underline guibg=#151515 guifg=#3b3b3b")

;; subtle delimiters
(cmd "hi MatchParen gui=underline guibg=#1f1f1f")

;; transparent vertical splits
(cmd "hi VertSplit guibg=bg guifg=bg")

;; bold various syntax & TODO
(cmd "hi Todo gui=bold")
(cmd "hi TSSymbol gui=bold")
(cmd "hi TSFunction gui=bold")
