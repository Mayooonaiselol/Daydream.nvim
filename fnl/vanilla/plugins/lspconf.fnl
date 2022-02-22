(module vanilla.plugins.lspconf
  {autoload {a aniseed.core
             str aniseed.string
             lsp lspconfig}})

(local config (require :lspconfig))

(let [{: config : severity} vim.diagnostic
      {: sign_define} vim.fn]
  (config {:underline {:severity {:min severity.INFO}}
           :signs {:severity {:min severity.INFO}}
           :virtual_text {:severity {:min severity.INFO}}
           :update_in_insert false
           :severity_sort true
           :float {:show_header false :border :single}})
  (sign_define :DiagnosticSignError {:text "" :texthl :DiagnosticSignError})
  (sign_define :DiagnosticSignWarn {:text "" :texthl :DiagnosticSignWarn})
  (sign_define :DiagnosticSignInfo {:text "" :texthl :DiagnosticSignInfo})
  (sign_define :DiagnosticSignHint {:text "" :texthl :DiagnosticSignHint}))

(fn init-lsp [lsp-name ?opts]
  "initialize a language server with defaults"
  (let [merged-opts (a.merge {:on_attach on_attach :capabilities default-capabilities} (or ?opts {}))]
    ((. lsp lsp-name :setup) merged-opts)))

(let [sumneko_root_path (.. vim.env.HOME "/.local/share/nvim/lsp_servers/sumneko_lua")
      sumneko_binary (.. sumneko_root_path "/extension/server/bin/lua-language-server")]
  (init-lsp
    :sumneko_lua
    {:cmd [sumneko_binary "-E" (.. sumneko_root_path "/main.lua")]
     :settings {:Lua {:runtime {:version "LuaJIT"
                                :path (vim.split package.path ";")}
                      :diagnostics {:globals ["vim"]}
                      :workspace {:library {(vim.fn.expand "$VIMRUNTIME/lua") true
                                            (vim.fn.expand "$VIMRUNTIME/lua/vim/lsp") true}}
                      :telemetry false}}}))

(let [{: with : handlers} vim.lsp]
  (set vim.lsp.handlers.textDocument/signatureHelp
       (with handlers.signature_help {:border :single}))
  (set vim.lsp.handlers.textDocument/hover
       (with handlers.hover {:border :single})))

(local lsp_installer (require :nvim-lsp-installer))

(lsp_installer.on_server_ready (fn [server]
                                 (let [opts {}]
                                   (set opts.capabilities
                                        ((. (require :cmp_nvim_lsp)
                                            :update_capabilities) (vim.lsp.protocol.make_client_capabilities)))
                                   (server:setup opts))))
