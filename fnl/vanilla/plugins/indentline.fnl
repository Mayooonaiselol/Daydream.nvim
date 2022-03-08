(local {: setup} (require "indent_blankline"))
(setup {:char "▏"
        :filetype_exclude {1 :terminal
                           2 :dashboard
                           3 :packer
                           4 :fennel
                           5 :TelescopePrompt
                           6 :TelescopeResults
                           7 :help
                           8 :lsp-installer
                           9 :lspinfo
                           10 ""}
        :buftype_exclude {1 :terminal 2 :nofile}
        :show_trailing_blankline_indent false
        :show_first_indent_level false})
