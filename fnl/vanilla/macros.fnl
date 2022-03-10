;; modified from https://github.com/datwaft/nvim.conf/blob/main/fnl/conf/macro/
(local {: format : gmatch} string)

(local {: insert} table)

;; packer
(global vanilla/plugins [])
(global vanilla/rock [])

;; qol functions
(fn ->str [x]
  (tostring x))

(fn head [xs]
  (. xs 1))

(fn cmd [string]
  `(vim.cmd ,string))

(fn str? [x]
  (= :string (type x)))

(fn tbl? [x]
  (= :table (type x)))

(fn nil? [x]
  (= nil x))

(fn includes? [xs x]
  (accumulate [is? false _ v (ipairs xs) :until is?]
    (= v x)))

(fn empty? [xs]
  (= 0 (length xs)))

; nnoremap
(fn nnoremap [left right ...]
  (let [left left
        right right
        output []
        tab []]
    (var isBuffer false) ; so we don't have to specify not in a buffer
    ; set that noremap is true
    (tset tab :noremap true)
    ; set each option to be true
    (each [key val (ipairs [...])]
      ; buffer isn't an option for nvim_set_keymap
      ; if we see buffer, set flag
      ; else just set the option to true
      (if (= val :buffer)
        (do (set isBuffer true))
        (do (tset tab val true))))
    ; if buffer is set, use a buffer map
    (if (= isBuffer true)
      (do
        `(vim.api.nvim_buf_set_keymap 0 :n ,left ,right ,tab))
      (do
        `(vim.api.nvim_set_keymap :n ,left ,right ,tab)))))

; inoremap
(fn inoremap [left right ...]
  (let [left left
        right right
        output []
        tab []]
    (var isBuffer false) ; so we don't have to specify not in a buffer
    ; set that noremap is true
    (tset tab :noremap true)
    ; set each option to be true
    (each [key val (ipairs [...])]
      ; buffer isn't an option for nvim_set_keymap
      ; if we see buffer, set flag
      ; else just set the option to true
      (if (= val :buffer)
        (do (set isBuffer true))
        (do (tset tab val true))))
    ; if buffer is set, use a buffer map
    (if (= isBuffer true)
      (do
        `(vim.api.nvim_buf_set_keymap 0 :i ,left ,right ,tab))
      (do
        `(vim.api.nvim_set_keymap :i ,left ,right ,tab)))))

; vnoremap
(fn vnoremap [left right ...]
  (let [left left
        right right
        output []
        tab []]
    (var isBuffer false) ; so we don't have to specify not in a buffer
    ; set that noremap is true
    (tset tab :noremap true)
    ; set each option to be true
    (each [key val (ipairs [...])]
      ; buffer isn't an option for nvim_set_keymap
      ; if we see buffer, set flag
      ; else just set the option to true
      (if (= val :buffer)
        (do (set isBuffer true))
        (do (tset tab val true))))
    ; if buffer is set, use a buffer map
    (if (= isBuffer true)
      (do
        `(vim.api.nvim_buf_set_keymap 0 :v ,left ,right ,tab))
      (do
        `(vim.api.nvim_set_keymap :v ,left ,right ,tab)))))

; tnoremap
(fn tnoremap [left right ...]
  (let [left left
        right right
        output []
        tab []]
    (var isBuffer false) ; so we don't have to specify not in a buffer
    ; set that noremap is true
    (tset tab :noremap true)
    ; set each option to be true
    (each [key val (ipairs [...])]
      ; buffer isn't an option for nvim_set_keymap
      ; if we see buffer, set flag
      ; else just set the option to true
      (if (= val :buffer)
        (do (set isBuffer true))
        (do (tset tab val true))))
    ; if buffer is set, use a buffer map
    (if (= isBuffer true)
      (do
        `(vim.api.nvim_buf_set_keymap 0 :t ,left ,right ,tab))
      (do
        `(vim.api.nvim_set_keymap :t ,left ,right ,tab)))))

; cnoremap
(fn cnoremap [left right ...]
  (let [left left
        right right
        output []
        tab []]
    (var isBuffer false) ; so we don't have to specify not in a buffer
    ; set that noremap is true
    (tset tab :noremap true)
    ; set each option to be true
    (each [key val (ipairs [...])]
      ; buffer isn't an option for nvim_set_keymap
      ; if we see buffer, set flag
      ; else just set the option to true
      (if (= val :buffer)
        (do (set isBuffer true))
        (do (tset tab val true))))
    ; if buffer is set, use a buffer map
    (if (= isBuffer true)
      (do
        `(vim.api.nvim_buf_set_keymap 0 :c ,left ,right ,tab))
      (do
        `(vim.api.nvim_set_keymap :c ,left ,right ,tab)))))

; xnoremap
(fn xnoremap [left right ...]
  (let [left left
        right right
        output []
        tab []]
    (var isBuffer false) ; so we don't have to specify not in a buffer
    ; set that noremap is true
    (tset tab :noremap true)
    ; set each option to be true
    (each [key val (ipairs [...])]
      ; buffer isn't an option for nvim_set_keymap
      ; if we see buffer, set flag
      ; else just set the option to true
      (if (= val :buffer)
        (do (set isBuffer true))
        (do (tset tab val true))))
    ; if buffer is set, use a buffer map
    (if (= isBuffer true)
      (do
        `(vim.api.nvim_buf_set_keymap 0 :x ,left ,right ,tab))
      (do
        `(vim.api.nvim_set_keymap :x ,left ,right ,tab)))))

; map
(fn map [left right ...]
  (let [left left
        right right
        output []
        tab []]
    (var isBuffer false) ; so we don't have to specify not in a buffer
    ; set that noremap is false
    (tset tab :noremap false)
    ; set each option to be true
    (each [key val (ipairs [...])]
      ; buffer isn't an option for nvim_set_keymap
      ; if we see buffer, set flg
      ; else just set the option to true
      (if (= val :buffer)
        (do (set isBuffer true))
        (do (tset tab val true))))
    ; if buffer is set, use a buffer map
    (if (= isBuffer true)
      (do
        `(vim.api.nvim_buf_set_keymap 0 "" ,left ,right ,tab))
      (do
        `(vim.api.nvim_set_keymap "" ,left ,right ,tab)))))

; nmap
(fn nmap [left right ...]
  (let [left left
        right right
        output []
        tab []]
    (var isBuffer false) ; so we don't have to specify not in a buffer
    ; set that noremap is false
    (tset tab :noremap false)
    ; set each option to be true
    (each [key val (ipairs [...])]
      ; buffer isn't an option for nvim_set_keymap
      ; if we see buffer, set flag
      ; else just set the option to true
      (if (= val :buffer)
        (do (set isBuffer true))
        (do (tset tab val true))))
    ; if buffer is set, use a buffer map
    (if (= isBuffer true)
      (do
        `(vim.api.nvim_buf_set_keymap 0 :n ,left ,right ,tab))
      (do
        `(vim.api.nvim_set_keymap :n ,left ,right ,tab)))))

; vmap
(fn vmap [left right ...]
  (let [left left
        right right
        output []
        tab []]
    (var isBuffer false) ; so we don't have to specify not in a buffer
    ; set that noremap is false
    (tset tab :noremap false)
    ; set each option to be true
    (each [key val (ipairs [...])]
      ; buffer isn't an option for nvim_set_keymap
      ; if we see buffer, set flag
      ; else just set the option to true
      (if (= val :buffer)
        (do (set isBuffer true))
        (do (tset tab val true))))
    ; if buffer is set, use a buffer map
    (if (= isBuffer true)
      (do
        `(vim.api.nvim_buf_set_keymap 0 :v ,left ,right ,tab))
      (do
        `(vim.api.nvim_set_keymap :v ,left ,right ,tab)))))

; imap
(fn imap [left right ...]
  (let [left left
        right right
        output []
        tab []]
    (var isBuffer false) ; so we don't have to specify not in a buffer
    ; set that noremap is false
    (tset tab :noremap false)
    ; set each option to be true
    (each [key val (ipairs [...])]
      ; buffer isn't an option for nvim_set_keymap
      ; if we see buffer, set flag
      ; else just set the option to true
      (if (= val :buffer)
        (do (set isBuffer true))
        (do (tset tab val true))))
    ; if buffer is set, use a buffer map
    (if (= isBuffer true)
      (do
        `(vim.api.nvim_buf_set_keymap 0 :i ,left ,right ,tab))
      (do
        `(vim.api.nvim_set_keymap :i ,left ,right ,tab)))))

; tmap
(fn tmap [left right ...]
  (let [left left
        right right
        output []
        tab []]
    (var isBuffer false) ; so we don't have to specify not in a buffer
    ; set that noremap is false
    (tset tab :noremap false)
    ; set each option to be true
    (each [key val (ipairs [...])]
      ; buffer isn't an option for nvim_set_keymap
      ; if we see buffer, set flag
      ; else just set the option to true
      (if (= val :buffer)
        (do (set isBuffer true))
        (do (tset tab val true))))
    ; if buffer is set, use a buffer map
    (if (= isBuffer true)
      (do
        `(vim.api.nvim_buf_set_keymap 0 :t ,left ,right ,tab))
      (do
        `(vim.api.nvim_set_keymap :t ,left ,right ,tab)))))

; cmap
(fn cmap [left right ...]
  (let [left left
        right right
        output []
        tab []]
    (var isBuffer false) ; so we don't have to specify not in a buffer
    ; set that noremap is false
    (tset tab :noremap false)
    ; set each option to be true
    (each [key val (ipairs [...])]
      ; buffer isn't an option for nvim_set_keymap
      ; if we see buffer, set flag
      ; else just set the option to true
      (if (= val :buffer)
        (do (set isBuffer true))
        (do (tset tab val true))))
    ; if buffer is set, use a buffer map
    (if (= isBuffer true)
      (do
        `(vim.api.nvim_buf_set_keymap 0 :c ,left ,right ,tab))
      (do
        `(vim.api.nvim_set_keymap :c ,left ,right ,tab)))))

; xmap
(fn xmap [left right ...]
  (let [left left
        right right
        output []
        tab []]
    (var isBuffer false) ; so we don't have to specify not in a buffer
    ; set that noremap is false
    (tset tab :noremap false)
    ; set each option to be true
    (each [key val (ipairs [...])]
      ; buffer isn't an option for nvim_set_keymap
      ; if we see buffer, set flag
      ; else just set the option to true
      (if (= val :buffer)
        (do (set isBuffer true))
        (do (tset tab val true))))
    ; if buffer is set, use a buffer map
    (if (= isBuffer true)
      (do
        `(vim.api.nvim_buf_set_keymap 0 :x ,left ,right ,tab))
      (do
        `(vim.api.nvim_set_keymap :x ,left ,right ,tab)))))


(fn fn? [x]
  "Returns whether the parameter(s) is a function.
  A function is defined as any list with 'fn or 'hashfn as their first
  element."
  (and (list? x) (or (= `fn (head x)) (= `hashfn (head x)))))

(λ gensym-checksum [...]
  "Generates a new symbol from the checksum of the object passed as
  a paremeter.
  The paremeter first is casted into a string using the function
  `fennel.view`.
  If only one paremeter is passed to the function the return value is the
  checksum as a symbol.
  If two paremeters are passed, the first one is considered the prefix.
  If three paremeters are passed, the first one is considered the prefix and
  the last one is considered the suffix.
  This function depends on the md5 library and the fennel library."
  (match [...]
    [prefix object suffix] (let [{: view} (require :fennel)
                                 {:sumhexa md5} (require :md5)]
                             (sym (.. prefix (md5 (view object)) suffix)))
    [prefix object] (gensym-checksum prefix object "")
    [object] (gensym-checksum "" object "")))

;; vlua, fnl functions in global namespace
(λ vlua [x]
  "Return a symbol mapped to `v:lua.%s()`, where `%s` is the symbol."
  (assert-compile (sym? x) "expected symbol for x" x)
  (format "v:lua.%s()" (->str x)))

;; packer
(λ pack [identifier ?options]
  "Returns a mixed table with the identifier as the first sequential element
  and options as hash-table items.
  See https://github.com/wbthomason/packer.nvim for information about the
  options."
  (assert-compile (str? identifier) "expected string for identifier" identifier)
  (assert-compile (or (nil? ?options) (tbl? ?options))
                  "expected table for options" ?options)
  (let [options (or ?options {})
        options (collect [k v (pairs options)]
                  (if (= k :config!)
                      (values :config (format "require('vanilla.plugins.%s')" v))
                      (= k :init)
                      (values :config (format "require('%s').setup()" v))
                      (values k v)))]
    (doto options
      (tset 1 identifier))))

(λ use-plug! [identifier ?options]
  "Declares a plugin with its options.
  This is a mixed table saved on the global compile-time variable conf/pack.
  See https://github.com/wbthomason/packer.nvim for information about the
  options."
  (assert-compile (str? identifier) "expected string for identifier" identifier)
  (assert-compile (or (nil? ?options) (tbl? ?options))
                  "expected table for options" ?options)
  (insert vanilla/plugins (pack identifier ?options)))

(λ rock [identifier ?options]
  "Returns a mixed table with the identifier as the first sequential element
  and options as hash-table items.
  See https://github.com/wbthomason/packer.nvim for information about the
  options."
  (assert-compile (str? identifier) "expected string for identifier" identifier)
  (assert-compile (or (nil? ?options) (tbl? ?options))
                  "expected table for options" ?options)
  (let [options (or ?options {})]
    (doto options
      (tset 1 identifier))))

(λ rock! [identifier ?options]
  "Declares a plugin with its options.
  This is a mixed table saved on the global compile-time variable conf/rock.
  See https://github.com/wbthomason/packer.nvim for information about the
  options."
  (assert-compile (str? identifier) "expected string for identifier" identifier)
  (assert-compile (or (nil? ?options) (tbl? ?options))
                  "expected table for options" ?options)
  (insert vanilla/rock (rock identifier ?options)))

(λ packer-setup! []
  "Initializes the plugin manager with the previously declared plugins and
  their options."
  (let [packs (icollect [_ v (ipairs vanilla/plugins)]
                `(use ,v))
        rocks (icollect [_ v (ipairs vanilla/rock)]
                `(use_rocks ,v))]
    `((. (require :packer) :startup) #(do
                                        ,(unpack (icollect [_ v (ipairs packs) :into rocks]
                                                   v))))))

(λ let! [name value]
  "Set a vim variable using the lua API.
  The name can be either a symbol or a string.
  If the name begins with [gbwt] followed by [/:.], the name is scoped to the
  respective scope:
  g -> global (default)
  b -> buffer
  w -> window
  t -> tab"
  (assert-compile (or (str? name) (sym? name))
                  "expected string or symbol for name" name)
  (let [name (->str name)
        scope (when (includes? [:g/
                                :b/
                                :w/
                                :t/
                                :g.
                                :b.
                                :w.
                                :t.
                                "g:"
                                "b:"
                                "w:"
                                "t:"]
                               (name:sub 1 2))
                (name:sub 1 1))
        name (if (nil? scope)
                 name
                 (name:sub 3))]
    `(tset ,(match scope
              :b `vim.b
              :w `vim.w
              :t `vim.t
              _ `vim.g) ,name ,value)))

(fn let!-mult [...]
  "Set one or multiple vim variables using the lua API.
  The name can be either a symbol or a string.
  If the name begins with [gbwt] followed by [/:.], the name is scoped to the
  respective scope:
  g -> global (default)
  b -> buffer
  w -> window
  t -> tab"
  (fn aux [...]
    (match [...]
      (where [& rest] (empty? rest)) []
      [name value & rest] [(let! name value) (unpack (aux (unpack rest)))]
      _ []))

  (let [exprs (aux ...)]
    (if (> (length exprs) 1)
        `(do
           ,(unpack exprs))
        (unpack exprs))))

(λ set! [name ?value]
  "Set a vim option using the lua API.
  The name of the option must be a symbol.
  If no value is specified, if the name begins with 'no' the value becomes
  false, it becomes true otherwise.
  e.g.
  `nospell` -> spell false
  `spell`   -> spell true"
  (assert-compile (sym? name) "expected symbol for name" name)
  (let [name (->str name)
        value (or ?value (not (name:match :^no)))
        name (or (name:match "^no(.+)$") name)]
    (if (fn? value)
        (let [fsym (gensym-checksum "__" value)]
          `(do
             (global ,fsym ,value)
             (tset vim.opt ,name ,(vlua fsym))))
        (match (name:sub -1)
          "+" `(: (. vim.opt ,(name:sub 1 -2)) :append ,value)
          "-" `(: (. vim.opt ,(name:sub 1 -2)) :remove ,value)
          "^" `(: (. vim.opt ,(name:sub 1 -2)) :prepend ,value)
          _ `(tset vim.opt ,name ,value)))))

(fn set!-mult [...]
  "Set one or multiple vim options using the lua API.
  The name of the option must be a symbol.
  If no value is specified, if the name begins with 'no' the value becomes
  false, it becomes true otherwise.
  e.g.
  `nospell` -> spell false
  `spell`   -> spell true"
  (fn aux [...]
    (match [...]
      (where [& rest] (empty? rest)) []
      (where [name value & rest] (not (sym? value)))
      [(set! name value) (unpack (aux (unpack rest)))]
      [name & rest] [(set! name) (unpack (aux (unpack rest)))]
      _ []))

  (let [exprs (aux ...)]
    (if (> (length exprs) 1)
        `(do
           ,(unpack exprs))
        (unpack exprs))))

(λ local-set! [name ?value]
  "Set a vim local option using the lua API.
  The name of the option must be a symbol.
  If no value is specified, if the name begins with 'no' the value becomes
  false, it becomes true otherwise.
  e.g.
  `nospell` -> spell false
  `spell`   -> spell true"
  (assert-compile (sym? name) "expected symbol for name" name)
  (let [name (->str name)
        value (or ?value (not (name:match :^no)))
        name (or (name:match "^no(.+)$") name)]
    (if (fn? value)
        (let [fsym (gensym-checksum "__" value)]
          `(do
             (global ,fsym ,value)
             (tset vim.opt_local ,name ,(vlua fsym))))
        (match (name:sub -1)
          "+" `(: (. vim.opt_local ,(name:sub 1 -2)) :append ,value)
          "-" `(: (. vim.opt_local ,(name:sub 1 -2)) :remove ,value)
          "^" `(: (. vim.opt_local ,(name:sub 1 -2)) :prepend ,value)
          _ `(tset vim.opt_local ,name ,value)))))

(fn local-set!-mult [...]
  "Set one or multiple vim local options using the lua API.
  The name of the option must be a symbol.
  If no value is specified, if the name begins with 'no' the value becomes
  false, it becomes true otherwise.
  e.g.
  `nospell` -> spell false
  `spell`   -> spell true"
  (fn aux [...]
    (match [...]
      (where [& rest] (empty? rest)) []
      (where [name value & rest] (not (sym? value)))
      [(local-set! name value) (unpack (aux (unpack rest)))]
      [name & rest] [(local-set! name) (unpack (aux (unpack rest)))]
      _ []))

  (let [exprs (aux ...)]
    (if (> (length exprs) 1)
        `(do
           ,(unpack exprs))
        (unpack exprs))))

(λ command! [name expr ?desc]
  "Define a user command using the lua API.
  See the help for nvim_add_user_command for more information."
  (assert-compile (or (str? name) (sym? name))
                  "expected string or symbol for name" name)
  (assert-compile (or (str? expr) (fn? expr) (sym? expr))
                  "expected string or function or symbol for expr" expr)
  (assert-compile (or (nil? ?desc) (str? ?desc))
                  "expected string or nil for description" ?desc)
  (let [name (->str name)
        desc (if (and (not ?desc) (or (fn? expr) (sym? expr))) (view expr)
                 ?desc)]
    `(vim.api.nvim_add_user_command ,name ,expr {:desc ,desc})))

{: command!
 : cmd
 : pack
 : use-plug!
 : rock
 : rock!
 : packer-setup!
 : vlua
 :map map
 :inoremap inoremap
 :imap imap
 :vnoremap vnoremap
 :vmap vmap
 :tnoremap tnoremap
 :tmap tmap
 :cnoremap cnoremap
 :cmap cmap
 :nnoremap nnoremap
 :nmap nmap
 :xnoremap xnoremap
 :xmap xmap
 :let! let!-mult
 :set! set!-mult
 :local-set! local-set!-mult}
