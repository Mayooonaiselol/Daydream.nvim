(local colors (require :vanilla.colors))
(local dream-theme {:normal {:a {:fg colors.base04 :bg colors.base01}
                             :b {:fg colors.base04 :bg colors.base01}
                             :c {:fg colors.base04 :bg colors.base01}}
                    :insert {:a {:fg colors.base04 :bg colors.base01}}
                    :visual {:a {:fg colors.base04 :bg colors.base01}}
                    :replace {:a {:fg colors.base04 :bg colors.base01}}
                    :inactive {:a {:fg colors.base04 :bg colors.base00}
                               :b {:fg colors.base04 :bg colors.base00}
                               :c {:fg colors.base04 :bg colors.base00}}})

((. (require :lualine) :setup) {:options {:icons_enabled true
                                          :theme dream-theme
                                          :component_separators {:left ""
                                                                 :right ""}
                                          :section_separators {:left ""
                                                               :right ""}
                                          :disabled_filetypes {}
                                          :always_divide_middle true}
                                :sections {:lualine_a {}
                                           :lualine_b {}
                                           :lualine_c {1 {1 :branch :icon ""}
                                                       2 {1 :diff :colored false}
                                                       3 {1 :diagnostics :diagnostics_color {:error {:fg colors.base04}
                                                                                             :warn {:fg colors.base04}
                                                                                             :hint {:fg colors.base04}
                                                                                             :info {:fg colors.base04}}}
                                                       4 {1 (fn []
                                                              (let [msg ""
                                                                    buf-ft (vim.api.nvim_buf_get_option 0 :filetype)
                                                                    clients (vim.lsp.get_active_clients)]
                                                                (each [_ client (ipairs clients)]
                                                                  (local filetypes client.config.filetypes)
                                                                  (when (and filetypes
                                                                             (not= (vim.fn.index filetypes buf-ft) (- 1)))
                                                                    (let [___antifnl_rtn_1___ client.name]
                                                                      (lua "return ___antifnl_rtn_1___"))))
                                                                msg))
                                                          :icon ""
                                                          :color {:fg colors.base04}}}
                                           :lualine_x {1 :encoding
                                                       2 :filename
                                                       3 :location}
                                           :lualine_y {}
                                           :lualine_z {}}
                                :inactive_sections {:lualine_a {}
                                                    :lualine_b {}
                                                    :lualine_c {1 :filename}
                                                    :lualine_x {1 :location}
                                                    :lualine_y {}
                                                    :lualine_z {}}
                                :tabline {}
                                :extensions {}})
