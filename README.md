<div align="center">
  
# Neovim for Server
[Installation](#installation) | [Features](#features) | [Structure](#structure) | [Customization](#customization)

<img width="1688" alt="image" src="https://github.com/user-attachments/assets/a8849a43-ac48-48fa-b595-b5f4a48ab9bf" />

</div>

## Prerequisites

* Neovim (v0.11.1)
* Nerd Font (MesloLGS Nerd Font Mono)
* iTerm 2 (optional for Mac)

## Installation
```bash
git clone https://github.com/tuanlda78202/nvimc.git ~/.config/nvim
nvim
```
## Features

- [x] [LazyVim](https://github.com/LazyVim/LazyVim)
- [x] [sainnhe/everforest](https://github.com/sainnhe/everforest)
- [x] Plugin management with [lazy.nvim](https://github.com/folke/lazy.nvim)
- [x] File Explorer with [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- [x] Beautiful status line with [lualine](https://github.com/nvim-lualine/lualine.nvim)
- [x] [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
- [x] [copilot.vim](https://github.com/github/copilot.vim)
- [x] Syntax highlighting with [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [x] Git integration with [gitsigns](https://github.com/lewis6991/gitsigns.nvim) and [lazygit](https://github.com/kdheepak/lazygit.nvim)
- [x] Fuzzy finding with [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [x] LSP support
- [x] [Auto-completion](https://github.com/hrsh7th/nvim-cmp)
- [x] Formatting
- [x] Linting
- [x] [outline.nvim](https://github.com/hedyhli/outline.nvim) 
- [x] Session management

## Structure

*  Entry Point:  [`init.lua`](https://github.com/tuanlda78202/nvimc/blob/main/init.lua)
*  Core Configuration: [`lua/charles/core/`](https://github.com/tuanlda78202/nvimc/tree/main/lua/charles/core) (settings, keymaps)
*  Plugin Manager: [`lua/charles/lazy.lua`](https://github.com/tuanlda78202/nvimc/blob/main/lua/charles/lazy.lua) (bootstraps `lazy.nvim`)
*  Plugin Definitions: [`lua/charles/plugins/`](https://github.com/tuanlda78202/nvimc/tree/main/lua/charles/plugins) (individual plugin specs)

## Customization

- General options: [`lua/charles/core/options.lua`](https://github.com/tuanlda78202/nvimc/blob/main/lua/charles/core/options.lua)
- Key mappings: [`lua/charles/core/keymaps.lua`](https://github.com/tuanlda78202/nvimc/blob/main/lua/charles/core/keymaps.lua)
- Plugins: [`lua/charles/plugins/`](https://github.com/tuanlda78202/nvimc/tree/main/lua/charles/plugins)
- LSP configuration: [`lua/charles/plugins/lsp/`](https://github.com/tuanlda78202/nvimc/tree/main/lua/charles/plugins/lsp)

## Troubleshooting

If you encounter any issues:

1. Update Neovim to the latest version
2. Run `:checkhealth` within Neovim to diagnose problems
3. Update plugins with `:Lazy update`

## Acknowledgement

* [josean-dev/dev-environment-files](https://github.com/josean-dev/dev-environment-files)

## Contributors 
<a href="https://github.com/tuanlda78202/nvimc/graphs/contributors">
<img src="https://contrib.rocks/image?repo=tuanlda78202/nvimc" /></a>
</a>
