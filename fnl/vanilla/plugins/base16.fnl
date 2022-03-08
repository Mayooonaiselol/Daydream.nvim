(import-macros {: cmd} :vanilla.macros)
(local {: setup} (require :base16-colorscheme))
(local colors (require :vanilla.colors))
(setup colors)

(cmd (.. "hi StatusLineNC gui=underline guibg=" colors.base00 " guifg=" colors.base03))
(cmd (.. "hi StatusLine gui=underline guibg=" colors.base00 " guifg=" colors.base03))

;; subtle delimiters
(cmd (.. "hi MatchParen gui=underline guibg=" colors.base01))

;; transparent vertical splits
(cmd (.. "hi VertSplit guibg=bg guifg=bg"))

;; bold various syntax & TODO
(cmd (.. "hi Todo gui=bold"))
(cmd (.. "hi TSSymbol gui=bold"))
(cmd (.. "hi TSFunction gui=bold"))

(cmd (.. "hi clear CursorLine"))
(cmd (.. "hi CursorLineNr guifg=" colors.base05 " guibg=" colors.base00))
(cmd (.. "hi LineNr guifg=" colors.base03 " guibg=" colors.base00))
