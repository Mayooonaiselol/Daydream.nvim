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

WIP! will be finished soon

## About

neovim pre-built configs (ready to use), works on neovim 0.6.1 and later.

## Showcase [todo: add upto date pictures]

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

- Add more, useful plugins if needed...Too many added, cleanup needed...done
- fix errors...Done
- add more keybinds
- add plugin configs...Mostly Done
- lazy loading
- add documentation
