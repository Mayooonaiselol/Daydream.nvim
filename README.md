# Daydream.nvim

<div align="center">

[![Fennel](	https://img.shields.io/badge/Made%20with%20Fennel-2C2D72?style=for-the-badge&logo=lua&logoColor=white)](https://fennel-lang.org)

</div>

<div align="center">

[![License](https://img.shields.io/github/license/shaunsingh/nyoom.nvim?style=flat-square)](https://mit-license.org/)
[![Neovim Minimum Version](https://img.shields.io/badge/Neovim-0.6.1-blueviolet.svg?style=flat-square&logo=Neovim&logoColor=white)](https://github.com/neovim/neovim)
[![GitHub Issues](https://img.shields.io/github/issues/Mayooonaiselol/Daydream.nvim.svg?style=flat-square&label=Issues&color=8abeb7)](https://github.com/Mayooonaiselol/Daydream.nvim/issues)
[![Last Commit](https://img.shields.io/github/last-commit/Mayooonaiselol/Daydream.nvim.svg?style=flat-square&label=Last%20Commit&color=0070cf)](https://github.com/Mayooonaiselol/Daydream.nvim/pulse)

</div>

WIP! will be finished soon

## About

neovim pre-built configs (ready to use), works on neovim 0.6.0 and later versions

## Showcase

Code completions

![img1](Screenshots/1645553362_grim.png)

![img2](Screenshots/1645553466_grim.png)

![img3](Screenshots/1645553551_grim.png)

Focused editing

![img4](Screenshots/1645553627_grim.png)

Git plugins

![img5](Screenshots/1645553678_grim.png)

![img6](Screenshots/1645553737_grim.png)

New! Lualine showing LSP stats

![img7](Screenshots/1645637956_grim.png)

## Install

### Dependencies

The only dependencies are neovim-0.6.1+ and git.

### Regular:

Install the following dependencies: 
- neovim-0.6.1+
- ripgrep
- nodejs (optional, for copilot)
- fennel + fnlfmt (not required, but recommended)
- font with nerdfont icons
- sqlite
- build-tools (optional, if errors occur)

Linux:
```bash
git clone https://github.com/Mayooonaiselol/Daydream.git ~/.config/nvim --depth 1 && nvim +PackerSync
```

Windows:
```
git clone https://github.com/Mayooonaiselol/Daydream.git Appdata\Local\nvim\ --depth 1; nvim +PackerSync
```

## Todo

- Add more, useful plugins if needed...Too many added, cleanup needed
- fix errors...Done
- add more keybinds
- add plugin configs...Mostly Done
- lazy loading
- add documentation
