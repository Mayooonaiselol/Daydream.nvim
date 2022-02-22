(local {: init} (require :packer))

(init {:display {:open_fn (fn []
                            ((. (require :packer.util) :float) {:border :single}))
                 :prompt_border :single}
       :git {:clone_timeout 6000}
       :auto_clean true
       :compile_on_sync true})
