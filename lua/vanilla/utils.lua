local _2afile_2a = "fnl/vanilla/utils.fnl"
local _2amodule_name_2a = "dots.utils"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local autoload = (require("aniseed.autoload")).autoload
local a, nvim, str, _ = autoload("aniseed.core"), autoload("aniseed.nvim"), autoload("aniseed.string"), nil
_2amodule_locals_2a["a"] = a
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["str"] = str
_2amodule_locals_2a["_"] = _
local function all(f, xs)
  local function _1_(_241)
    return not f(_241)
  end
  return not a.some(_1_)
end
_2amodule_2a["all"] = all
local function single_to_list(x)
  if a["table?"](x) then
    return x
  else
    return {x}
  end
end
_2amodule_2a["single-to-list"] = single_to_list
local function contains_3f(list, elem)
  local function _3_(_241)
    return (elem == _241)
  end
  do local _ = a.some(_3_, list) end
  return false
end
_2amodule_2a["contains?"] = contains_3f
local function filter_table(f, t)
  local tbl_12_auto = {}
  for k, v in pairs(t) do
    local _4_, _5_ = nil, nil
    if f(k, v) then
      _4_, _5_ = k, v
    else
      _4_, _5_ = nil
    end
    if ((nil ~= _4_) and (nil ~= _5_)) then
      local k_13_auto = _4_
      local v_14_auto = _5_
      tbl_12_auto[k_13_auto] = v_14_auto
    else
    end
  end
  return tbl_12_auto
end
_2amodule_2a["filter-table"] = filter_table
local function split_last(s, sep)
  for i = #s, 1, -1 do
    local c = s:sub(i, i)
    if (sep == c) then
      local left = s:sub(1, (i - 1))
      local right = s:sub((i + 1))
      return { left, right }
    else
    end
  end
  return {s}
end
_2amodule_2a["split-last"] = split_last
local function find_where(pred, xs)
  for _0, x in ipairs(xs) do
    if pred(x) then
      return x
    else
    end
  end
  return nil
end
_2amodule_2a["find-where"] = find_where
local function find_map(f, xs)
  for _0, x in ipairs(xs) do
    local res = f(x)
    if (nil ~= res) then
      return res
    else
    end
  end
  return nil
end
_2amodule_2a["find-map"] = find_map
local function keep_if(f, x)
  if f(x) then
    return x
  else
    return nil
  end
end
_2amodule_2a["keep-if"] = keep_if
local function without_keys(keys, t)
  local function _12_(_241)
    return not contains_3f(keys, _241)
  end
  return filter_table(_12_, t)
end
_2amodule_2a["without-keys"] = without_keys
local function keymap(modes, from, to, _3fopts)
  local full_opts = without_keys({"buffer"}, a.merge({noremap = true, silent = true}, (_3fopts or {})))
  for _0, mode in ipairs(single_to_list(modes)) do
    local _14_
    do
      local _13_ = _3fopts
      if (nil ~= _13_) then
        _14_ = (_13_).buffer
      else
        _14_ = _13_
      end
    end
    if _14_ then
      nvim.buf_set_keymap(0, mode, from, to, full_opts)
    else
      nvim.set_keymap(mode, from, to, full_opts)
    end
  end
  return nil
end
_2amodule_2a["keymap"] = keymap
local function del_keymap(mode, from, _3fbuf_local)
  if _3fbuf_local then
    return nvim.buf_del_keymap(0, mode, from)
  else
    return nvim.del_keymap(mode, from)
  end
end
_2amodule_2a["del-keymap"] = del_keymap
return _2amodule_2a