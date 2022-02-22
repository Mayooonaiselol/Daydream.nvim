local _2afile_2a = ".config/nvim/fnl/vanilla/plugins/lightbulb.fnl"
local _local_1_ = require("nvim-lightbulb")
local update_lightbulb = _local_1_["update_lightbulb"]
return update_lightbulb({sign = {enabled = true, priority = 10}, float = {enabled = false, text = "\240\159\146\161"}, virtual_text = {enabled = false, text = "\240\159\146\161", hl_mode = "replace"}, status_text = {enabled = false, text = "\240\159\146\161", text_unavailable = ""}})