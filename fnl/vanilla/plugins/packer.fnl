(local {: init} (require :packer))

(init {:display {:open_fn (fn []
                            ((. (require :packer.util) :float) {:border :single}))
                 :prompt_border :rounded
                 :non_interactive false
                 :open_cmd "65vnew \\[packer\\]"
                 :item_sym ""
                 :header_lines 2
                 :title " packer.nvim"
                 :working_sym " "
                 :error_sym ""
                 :done_sym ""
                 :removed_sym ""
                 :moved_sym " "
                 :show_all_info false}
       :git {:clone_timeout 6000}
       :auto_clean true
       :compile_on_sync true})
