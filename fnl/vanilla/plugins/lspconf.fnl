(module vanilla.plugins.lspconf
  {autoload {a aniseed.core
             str aniseed.string
             lsp lspconfig}})

(local config (require :lspconfig))

(let [{: config : severity} vim.diagnostic
      {: sign_define} vim.fn]
  (config {:underline {:severity {:min severity.INFO}}
           :signs {:severity {:min severity.INFO}}
           :virtual_text false
           :update_in_insert false
           :severity_sort true
           :float {:show_header false :border :single}})
  (sign_define :DiagnosticSignError {:text "" :texthl :DiagnosticSignError})
  (sign_define :DiagnosticSignWarn {:text "" :texthl :DiagnosticSignWarn})
  (sign_define :DiagnosticSignInfo {:text "" :texthl :DiagnosticSignInfo})
  (sign_define :DiagnosticSignHint {:text "" :texthl :DiagnosticSignHint}))

(let [{: with : handlers} vim.lsp]
  (set vim.lsp.handlers.textDocument/signatureHelp
       (with handlers.signature_help {:border :single}))
  (set vim.lsp.handlers.textDocument/hover
       (with handlers.hover {:border :single})))

(local lsp_installer (require :nvim-lsp-installer))
(local {: settings} (require :nvim-lsp-installer))

(settings {:ui {:icons {:server_installed ""
                        :server_pending ""
                        :server_uninstalled ""}}})

(lsp_installer.on_server_ready (fn [server]
                                 (let [opts {}]
                                   (set opts.capabilities
                                        ((. (require :cmp_nvim_lsp)
                                            :update_capabilities) (vim.lsp.protocol.make_client_capabilities)))
                                   (server:setup opts))))

;; (fn ensure-servers []
;;   (each [name _ (ipairs servers)]
;;     (local (found server) (lsp_installer.get_server name))
;;     (when (and found (not (server:is_installed)))
;;       (print (.. "Installing " name))
;;       (server:install)))
;;   (api.nvim_notify (.. "Installed " (table.concat (vim.tbl_keys servers) "\n"))
;;                    vim.log.levels.INFO {:icon " " :title :nvim-lsp-installer}))
;;
;; (ensure-servers)
