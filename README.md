# Daydream.nvim

<div align="center">

[![Fennel](	https://img.shields.io/badge/Made%20with%20Fennel-2C2D72?style=for-the-badge&logo=lua&logoColor=white)](https://fennel-lang.org)

</div>

<div align="center">

[![Stars](https://img.shields.io/github/stars/Mayooonaiselol/Daydream.nvim?color=%23b66467&style=for-the-badge)](https://github.com/Mayooonaiselol/Daydream.nvim/stargazers)
[![GitHub Issues](https://img.shields.io/github/issues/Mayooonaiselol/Daydream.nvim?color=%238c977d&style=for-the-badge)](https://github.com/Mayooonaiselol/Daydream.nvim/issues)
[![Forks](https://img.shields.io/github/forks/Mayooonaiselol/Daydream.nvim?color=%23d9bc8c&logoColor=%23151515&style=for-the-badge)](https://github.com/Mayooonaiselol/Daydream.nvim/network/members)
[![License](https://img.shields.io/github/license/Mayooonaiselol/Daydream.nvim?color=%238da3b9&style=for-the-badge)](https://mit-license.org/)

</div>

Neovim configuration for Emacs users, who may find configuring neovim in fennel easier, works on neovim 0.6.1 and later.

This is an extended base config of https://github.com/shaunsingh/nyoom.nvim

This awesome colourscheme used in these configs is https://github.com/Manas140/paradise

Everything happens in the `fnl/` folder.

- `init.fnl` to require fennel configs (not plugin configs, you have to define that in plug.fnl)
- `colors.fnl` to define your colourscheme (current one used in the configs is paradise)
- `core.fnl` to set neovim settings and autocmds
- `keys.fnl` to set keybinds/mappings
- `plug.fnl` to add and install plugins using packer.nvim
- `macros.fnl` to define functions and make configuring easier, I have added macros which can even work with neovim 0.6.1 and some other macros on top of the base config from nyoom.nvim (you are free to edit this if you know what it is)
- `plugins/` to define plugin configs

If you need any help, you can ask me at discord or join the [Conjure Discord](https://conjure.fun/discord)

## Credits

- [shaunsingh](https://github.com/shaunsingh) for making nyoom.nvim and helping me out with fennel
- [Manas](https://github.com/Manas140) for the eye-pleasing colourscheme and contributions for these configs
- [pagankeymaster](https://github.com/pagankeymaster) for making a neovim config dictionary...

## Showcase

![img1](Screenshots/1645553362_grim.png)

![img2](Screenshots/1645553466_grim.png)

![img3](Screenshots/1645553551_grim.png)

![img4](Screenshots/1645553627_grim.png)

![img5](Screenshots/1645553678_grim.png)

![img6](Screenshots/1645553737_grim.png)

![img7](Screenshots/1645637956_grim.png)

## Install

### Dependencies

The only dependencies are neovim-0.6.1+, a font with nerdfont icons and git.

### Regular:

Install the following dependencies: 
- neovim-0.6.1+
- ripgrep
- nodejs (optional)
- fennel + fnlfmt (not required, but recommended)
- font with nerdfont icons
- build-tools (optional, if errors occur)

Install using the following command:

```bash
git clone https://github.com/Mayooonaiselol/Daydream.git ~/.config/nvim --depth 1 && nvim +PackerSync
```
