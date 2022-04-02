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

[Skip to Installation](https://github.com/Mayooonaiselol/Daydream.nvim/tree/master#install)

[Skip to Showcase](https://github.com/Mayooonaiselol/Daydream.nvim/tree/master#showcase)

Neovim configuration useful for Emacs users who want to use neovim(but can also be used by others), who may find configuring neovim in fennel easier, works on neovim 0.6.1 and later.

This is a neovim config written in fennel, many parts of this config are based on [nyoom.nvim](https://github.com/shaunsingh/nyoom.nvim)

This awesome colourscheme used in these configs is [paradise](https://github.com/Manas140/paradise)

Everything happens in the `fnl/` folder.

- `init.fnl` to require fennel configs (not plugin configs, you have to define that in plug.fnl)
- `colors.fnl` to define your colourscheme (current one used in the configs is paradise)
- `core.fnl` to set neovim settings and autocmds
- `keys.fnl` to set keybinds/mappings
- `plug.fnl` to add and install plugins using packer.nvim
- `macros.fnl` to define functions and make configuring easier, I have added macros which can even work with neovim 0.6.1 and some other macros on top of the base config from nyoom.nvim (you are free to edit this if you know what it is)
- `plugins/` to define plugin configs

If you need any help, you can ask me at discord or join the [Conjure Discord](https://conjure.fun/discord)

## Useful plugins used

- which-key.nvim
- indent-blankline.nvim
- lualine
- bufferline
- Telescope
- Comment.nvim
- nvim-autopairs
- treesitter
- lspinstaller
- nvim-cmp and Luasnip
- truezen
- nvim-colorizer.lua
- Neorg
- Gitsigns
- Trouble.nvim

## Credits

- [shaunsingh](https://github.com/shaunsingh) for making nyoom.nvim and helping me out with fennel
- [Manas](https://github.com/Manas140) for the eye-pleasing colourscheme and contributions for these configs
- [keymaster](https://github.com/pagankeymaster) for making a neovim config dictionary...

## Showcase

![img1](Screenshots/1648900820_grim.png)

Notifications

![img2](Screenshots/1648900691_grim.png)

Telescope

![img3](Screenshots/1648900716_grim.png)

Focus mode (Truezen)

![img4](Screenshots/1648900737_grim.png)

Trouble.nvim and neovim LSP

![img5](Screenshots/1648903199_grim.png)

Completions

![img6](Screenshots/1648900879_grim.png)

Neorg(not a default, just uncomment lines in plug.fnl to use it)

![img7](Screenshots/1648900931_grim.png)

TSPlayground showing treesitter info

![img8](Screenshots/1648901062_grim.png)

which-key.nvim

![img9](Screenshots/1648902063_grim.png)

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

Backup your configs first!

```bash
mv ~/.config/nvim ~/.config/NVIM.BAK
```

Clean all the required directories

```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
```

Install using the following command:

```bash
git clone https://github.com/Mayooonaiselol/Daydream.git ~/.config/nvim --depth 1 && nvim +PackerSync
```
