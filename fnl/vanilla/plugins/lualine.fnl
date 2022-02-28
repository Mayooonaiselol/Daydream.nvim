(module vanilla.plugins.lualine
  {autoload {nvim aniseed.nvim
             base16 vanilla.plugins.base16}})

(local {: setup} (require :lualine))

(setup {:options {:icons_enabled true
                        :theme :auto
                        :component_separators {:left ""
                                               :right ""}
                        :section_separators {:left ""
                                             :right ""}
                        :disabled_filetypes {}
                        :always_divide_middle true}
              :sections {:lualine_a {1 :mode}
                         :lualine_b {1 :branch
                                     2 :diff
                                     3 :diagnostics}
                         :lualine_c {1 :filename}
                         :lualine_x {1 :encoding
                                     2 :fileformat
                                     3 :filetype}
                         :lualine_y {1 :progress}
                         :lualine_z {1 :location}}
              :inactive_sections {:lualine_a {}
                                  :lualine_b {}
                                  :lualine_c {1 :filename}
                                  :lualine_x {1 :location}
                                  :lualine_y {}
                                  :lualine_z {}}
              :tabline {}
              :extensions {}})
