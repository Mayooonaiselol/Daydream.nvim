(import-macros {: set! : let! : cmd} :vanilla.macros)
(local {: setup
        : mapping
        :config {: compare : disable}
        :SelectBehavior {:Insert insert-behavior :Select select-behavior}
        : event} (require :cmp))

(local types (require :cmp.types))
(local under-compare (require :cmp-under-comparator))
(local {: insert} table)

(local friendly_snippets (require :luasnip.loaders.from_vscode))
( friendly_snippets.load)

;; and of course some settings
(set! completeopt [:menu :menuone :noselect])

(setup {:preselect types.cmp.PreselectMode.None
        :formatting {:format (fn [entry vim-item]
                               (set vim-item.menu
                                    (. {:nvim_lsp :lsp
                                        :Path :pth
                                        :treesitter :trs
                                        :conjure :cj
                                        :luasnip :snip
                                        :buffer :buf}
                                       entry.source.name))
                               (set vim-item.kind
                                    (. {:Text ""
                                        :Method ""
                                        :Function ""
                                        :Constructor ""
                                        :Field "ﰠ"
                                        :Variable ""
                                        :Class "ﴯ"
                                        :Interface ""
                                        :Module ""
                                        :Property "ﰠ"
                                        :Unit "塞"
                                        :Value ""
                                        :Enum ""
                                        :Keyword ""
                                        :Snippet ""
                                        :Color ""
                                        :File ""
                                        :Reference ""
                                        :Folder ""
                                        :EnumMember ""
                                        :Constant ""
                                        :Struct "פּ"
                                        :Event ""
                                        :Operator ""
                                        :TypeParameter ""}
                                       vim-item.kind))
                               vim-item)}
        :mapping {:<C-b> (mapping.scroll_docs -4)
                  :<C-f> (mapping.scroll_docs 4)
                  :<C-space> (mapping.complete)
                  :<C-e> (mapping.abort)
                  :<up> disable
                  :<down> disable
                  :<Tab> (mapping (mapping.select_next_item {:behavior insert-behavior})
                                  [:i :s])
                  :<S-Tab> (mapping (mapping.select_prev_item {:behavior insert-behavior})
                                    [:i :s])
                  :<space> (mapping.confirm {:select false})}
        :sources [{:name :nvim_lsp}
                  {:name :conjure}
                  {:name :luasnip}
                  {:name :path}
                  {:name :buffer}]
        :sorting {:comparators [compare.offset
                                compare.exact
                                compare.score
                                under-compare.under
                                compare.kind
                                compare.sort_text
                                compare.length
                                compare.order]}})
