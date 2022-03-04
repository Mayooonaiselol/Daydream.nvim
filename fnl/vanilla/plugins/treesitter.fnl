(local {: setup} (require :nvim-treesitter.configs))
(setup {:ensure_installed {1 :lua 2 :fennel 3 :norg}
        :highlight {:enable true
                    :use_languagetree true}
        :indent {:enable true}})
