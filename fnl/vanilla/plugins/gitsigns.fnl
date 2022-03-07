(module vanilla.plugins.gitsigns
  {autoload {utils vanilla.utils
             gitsigns gitsigns}})

(gitsigns.setup 
  {:signs {:add          {:text "▍"}
           :change       {:text "▍"}
           :delete       {:text ""}
           :topdelete    {:text "‾"}
           :changedelete {:text "~"}}
   :keymaps {:noremap true 
             :buffer true}
   :current_line_blame false
   :update_debounce 100})
