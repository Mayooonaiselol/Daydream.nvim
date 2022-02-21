local _2afile_2a = "fnl/vanilla/plugins/lightbulb.fnl"
local _local_1_ = require("nvim-lightbulb.update_lightbulb")
local setup = _local_1_["setup"]
return setup({sign = {enabled = true, priority = 10}, float = {enabled = false, text = "\240\159\146\161"}, virtual_text = {enabled = false, text = "\240\159\146\161", hl_mode = "replace"}, status_text = {enabled = false, text = "\240\159\146\161", text_unavailable = ""}})