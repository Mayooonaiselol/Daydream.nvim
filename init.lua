function ensure(user, repo, plugin)
    local install_path = string.format("%s/packer/start/%s", vim.fn.stdpath("data") .. "/site/pack", repo, repo)
        if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        print("Installing", plugin)
        vim.api.nvim_command(string.format("!git clone https://github.com/%s/%s %s", user, repo, install_path))
        vim.api.nvim_command(string.format("packadd %s", repo))
    end
end

-- Bootstrap essential plugins required for installing and loading the rest.
ensure("wbthomason", "packer.nvim", "Packer")
ensure("lewis6991", "impatient.nvim", "impatient.nvim")

-- Load impatient which pre-compiles and caches Lua modules.
require("impatient")

-- global variable to set the user's fennel compiler
fennel_compiler = "aniseed"

if fennel_compiler == "aniseed" then
    ensure("Olical", "aniseed", "Aniseed")
    vim.g["aniseed#env"] = {module = "vanilla.init"}
elseif fennel_compiler == "hotpot" then
    ensure("rktjmp", "hotpot.nvim", "Hotpot")
    require("hotpot").setup({
       provide_require_fennel = true,
     })
    require("vanilla")
else
    error("Unknown compiler")
end
