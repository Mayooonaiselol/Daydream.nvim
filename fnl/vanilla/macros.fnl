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

(fn ->bool [x]
  (if x true false))

(fn bool? [x]
  (= :boolean (type x)))

(fn includes? [xs x]
  (accumulate [is? false _ v (ipairs xs) :until is?]
    (= v x)))

(fn empty? [xs]
  (= 0 (length xs)))

; augroup
(fn augroup [group ...]
  ; set up augroup group autocmd!
  (let [group (.. "augroup " (->str group) "\nautocmd!")]
    `(do
       (cmd ,group)
       ; do the autocmd
       (do
         ,...)
       ; close the autocmd group
       (cmd "augroup END"))))

; autocmd
(fn autocmd [event filetype command]
  (let [event (->str event)
        command command]
    ; check if the filetype is a regex
    ; set to string first so its parsed as such
    ; else just set to value of the filetype arg
    (var ftOut (->str filetype))
    (if (= ftOut "*")
      (set ftOut "*")
      (set ftOut filetype))
    `(do
      (cmd (.. "autocmd " ,event " " ,ftOut " " ,command)))))

(fn fn? [x]
  "Returns whether the parameter(s) is a function.
  A function is defined as any list with 'fn or 'hashfn as their first
  element."
  (and (list? x) (or (= `fn (head x)) (= `hashfn (head x)))))

(λ map! [buffer? mode options lhs rhs]
  "Defines a new mapping using the lua API.
  It uses `vim.api.nvim_set_keymap` if buffer? is true and
  `vim.api.nvim_buf_set_keymap` if buffer? is false.
  If rhs is a function, a symbol or a list the expr option is set.
  Supports all the options that the API supports."
  (assert-compile (bool? buffer?) "expected boolean for buffer?" buffer?)
  (assert-compile (str? mode) "expected string for mode" mode)
  (assert-compile (tbl? options) "expected table for options" options)
  (assert-compile (str? lhs) "expected string for lhs" lhs)
  (assert-compile (str? rhs) "expected string for rhs" rhs)
  (if buffer?
    `(vim.api.nvim_buf_set_keymap 0 ,mode ,lhs ,rhs ,options)
    `(vim.api.nvim_set_keymap ,mode ,lhs ,rhs ,options)))

(λ map!-mult [[modes & options] lhs rhs ?desc]
  "Defines a new mapping using the lua API.
  It uses `vim.api.nvim_set_keymap` if buffer? is true and
  `vim.api.nvim_buf_set_keymap` if buffer? is false.
  If rhs is a function, a symbol or a list the expr option is set.
  Supports all the options that the API supports."
  (assert-compile (or (str? modes) (sym? modes)) "expected string or symbol for modes" modes)
  (assert-compile (tbl? options) "expected table for options" options)
  (assert-compile (str? lhs) "expected string for lhs" lhs)
  (assert-compile (or (str? rhs) (list? rhs) (fn? rhs) (sym? rhs)) "expected string or list or function or symbol for rhs" rhs)
  (assert-compile (or (nil? ?desc) (str? ?desc)) "expected string or nil for description" ?desc)
  (let [modes (icollect [char (gmatch (->str modes) ".")] char)
        options (collect [_ v (ipairs options)] (->str v) true)
        buffer? (->bool (. options :buffer))
        options (doto options (tset :buffer nil))
        rhs (if (and (not (fn? rhs)) (list? rhs)) `#,rhs
              rhs)
        desc (if (and (not ?desc) (or (fn? rhs) (sym? rhs))) (view rhs)
               ?desc)
        options (if desc (doto options (tset :desc desc))
                  options)
        options (if (or (fn? rhs) (sym? rhs)) (doto options (tset :callback rhs))
                  options)
        options (if (or (fn? rhs) (sym? rhs)) (doto options (tset :expr true))
                  options)
        rhs (if (or (fn? rhs) (sym? rhs)) ""
              rhs)
        exprs (icollect [_ mode (ipairs modes)]
                        (map! buffer? mode options lhs rhs ?desc))]
    (if (> (length exprs) 1)
      `(do ,(unpack exprs))
      (unpack exprs))))

(λ noremap! [[modes & options] lhs rhs ?description]
  "Defines a new mapping using the lua API.
  It uses `vim.api.nvim_set_keymap` if buffer? is true and
  `vim.api.nvim_buf_set_keymap` if buffer? is false.
  If rhs is a function, a symbol or a list the expr option is set.
  Supports all the options that the API supports.
  Automatically sets the `:noremap` option."
  (let [options (doto options
                      (insert :noremap))]
    (map!-mult [modes (unpack options)] lhs rhs ?description)))

(λ buf-map! [[modes & options] lhs rhs ?description]
  "Defines a new mapping using the lua API.
  It uses `vim.api.nvim_set_keymap` if buffer? is true and
  `vim.api.nvim_buf_set_keymap` if buffer? is false.
  If rhs is a function, a symbol or a list the expr option is set.
  Supports all the options that the API supports.
  Automatically sets the `:buffer` option."
  (let [options (doto options
                      (insert :buffer))]
    (map!-mult [modes (unpack options)] lhs rhs ?description)))

(λ buf-noremap! [[modes & options] lhs rhs ?description]
  "Defines a new mapping using the lua API.
  It uses `vim.api.nvim_set_keymap` if buffer? is true and
  `vim.api.nvim_buf_set_keymap` if buffer? is false.
  If rhs is a function, a sybol or a list the expr option is set.
  Supports all the options that the API supports.
  Automatically sets the `:noremap` option and the `:buffer` option."
  (let [options (doto options
                      (insert :noremap)
                      (insert :buffer))]
    (map!-mult [modes (unpack options)] lhs rhs ?description)))

(λ link! [new to old]
  "Defines a highlight group using the vim API.
  e.g. (link! new => old)"
  (assert-compile (sym? new) "expected symbol for new" new)
  (assert-compile (= '=> to) "expected => for to" to)
  (assert-compile (sym? old) "expected symbol for old" old)
  (let [new (->str new)
        old (->str old)]
    `(vim.api.nvim_set_hl 0 ,new {:link ,old})))

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

{: cmd
 : pack
 : use-plug!
 : rock
 : rock!
 : packer-setup!
 : vlua
 : link!
 :augroup augroup
 :autocmd autocmd
 :map! map!-mult
 : noremap!
 : buf-map!
 : buf-noremap!
 :let! let!-mult
 :set! set!-mult
 :local-set! local-set!-mult}
