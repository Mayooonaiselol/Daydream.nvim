(local colors (require :vanilla.colors))

((. (require :bufferline) :setup) {:options {:separator_style {1 "" 2 ""}
                                             :show_tab_indicators false}
                                   :highlights {:fill {:guifg colors.base00
                                                       :guibg colors.base00}
                                                :background {:guifg colors.base03
                                                             :guibg colors.base00}
                                                :buffer_selected {:guifg colors.base05
                                                                  :guibg colors.base00}
                                                :buffer_visible {:guifg colors.base03
                                                                 :guibg colors.base00}
                                                :close_button {:guifg colors.base03
                                                               :guibg colors.base00}
                                                :close_button_visible {:guifg colors.base03
                                                                       :guibg colors.base00}
                                                :close_button_selected {:guifg colors.base08
                                                                        :guibg colors.base00}
                                                :indicator_selected {:guifg colors.base00
                                                                     :guibg colors.base00}
                                                :modified {:guifg colors.base03
                                                           :guibg colors.base00}
                                                :modified_visible {:guifg colors.base00
                                                                   :guibg colors.base00}
                                                :modified_selected {:guifg colors.base0B
                                                                    :guibg colors.base00}
                                                :tab_close {:guifg colors.base08
                                                            :guibg colors.base00}}})
