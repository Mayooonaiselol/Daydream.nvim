function ensure(user, repo)
    local install_path = string.format("%s/packer/start/%s", vim.fn.stdpath("data") .. "/site/pack", repo, repo)
        if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.api.nvim_command(string.format("!git clone https://github.com/%s/%s %s", user, repo, install_path))
        vim.api.nvim_command(string.format("packadd %s", repo))
    end
end

-- Bootstrap essential plugins required for installing and loading the rest.
ensure("wbthomason", "packer.nvim")
ensure("Olical", "aniseed")
ensure("lewis6991", "impatient.nvim")

-- Load impatient which pre-compiles and caches Lua modules.
require("impatient")

-- Enable Aniseed's automatic compilation and loading of Fennel source code.
vim.g["aniseed#env"] = {module = "vanilla.init"}
