(local {: setup} (require :nvim-tree))

(setup {:disable_netrw true
        :hijack_netrw true
        :ignore_ft_on_setup {}
        :auto_close false
        :hijack_cursor true
        :hijack_unnamed_buffer_when_opening false
        :update_cwd true
        :update_focused_file {:enable true
                              :update_cwd false}
        :view {:allow_resize true
               :side "left"
               :width 25
               :hide_root_folder true}
        :git {:enable false
              :ignore false}})
