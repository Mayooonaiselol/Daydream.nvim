(fn []
  (set vim.notify (require :notify))
  (local {: setup} (require :notify))
  (setup {:stages :slide
          :timeout 2500
          :minimum_width 50
          :icons {:ERROR ""
                  :WARN ""
                  :INFO ""
                  :DEBUG ""
                  :TRACE "✎"}}))

(local client-notifs {})
(local spinner-frames {1 "⣾"
                       2 "⣽"
                       3 "⣻"
                       4 "⢿"
                       5 "⡿"
                       6 "⣟"
                       7 "⣯"
                       8 "⣷"})
(fn update-spinner [client-id token]
  (let [notif-data (. (. client-notifs client-id) token)]
    (when (and notif-data notif-data.spinner)
      (local new-spinner (% (+ notif-data.spinner 1) (length spinner-frames)))
      (local new-notif
             (vim.notify nil nil
                         {:hidden true
                          :icon (. spinner-frames new-spinner)
                          :replace notif-data.notification}))
      (tset (. client-notifs client-id) token
            {:notification new-notif :spinner new-spinner})
      (vim.defer_fn (fn []
                      (update-spinner client-id token)) 100))))
(fn format-title [title client]
  (.. client.name (or (and (> (length title) 0) (.. ": " title)) "")))
(fn format-message [message percentage]
  (.. (or (and percentage (.. percentage "%\t")) "") (or message "")))
(tset vim.lsp.handlers :$/progress
      (fn [_ result ctx]
        (let [client-id ctx.client_id
              val result.value]
          (when (not val.kind)
            (lua "return "))
          (when (not (. client-notifs client-id))
            (tset client-notifs client-id {}))
          (local notif-data (. (. client-notifs client-id) result.token))
          (if (= val.kind :begin)
              (let [message (format-message val.message val.percentage)
                    notification (vim.notify message :info
                                             {:title (format-title val.title
                                                                   (vim.lsp.get_client_by_id client-id))
                                              :icon (. spinner-frames 1)
                                              :timeout false
                                              :hidden false})]
                (tset (. client-notifs client-id) result.token
                      {: notification :spinner 1})
                (update-spinner client-id result.token))
              (and (= val.kind :report) notif-data)
              (let [new-notif (vim.notify (format-message val.message
                                                          val.percentage)
                                          :info
                                          {:replace notif-data.notification
                                           :hidden false})]
                (tset (. client-notifs client-id) result.token
                      {:notification new-notif :spinner notif-data.spinner}))
              (and (= val.kind :end) notif-data)
              (let [new-notif (vim.notify (or (and val.message
                                                   (format-message val.message))
                                              :Complete)
                                          :info
                                          {:icon ""
                                           :replace notif-data.notification
                                           :timeout 3000})]
                (tset (. client-notifs client-id) result.token
                      {:notification new-notif}))))))
