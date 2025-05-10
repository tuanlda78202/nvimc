# Neovim for MacOS

| ![nvidia-docker](https://github.com/tuanlda78202/nvimc/blob/main/assets/neovim.jpeg) |
|:--:|
| Variety Is Magic|

## Prerequisites

* Neovim
* Nerd Font (MesloLGS Nerd Font Mono)
* iTerm 2 (optional)

## Installation
```bash
git clone https://github.com/tuanlda78202/nvimc.git ~/.config/nvim
nvim
```
## Features

- Plugin management with [lazy.nvim](https://github.com/folke/lazy.nvim)
- File explorer with [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- Beautiful status line with [lualine](https://github.com/nvim-lualine/lualine.nvim)
- Syntax highlighting with [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- Git integration with [gitsigns](https://github.com/lewis6991/gitsigns.nvim) and [lazygit](https://github.com/kdheepak/lazygit.nvim)
- Fuzzy finding with [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- LSP (Language Server Protocol) support
- Auto-completion with nvim-cmp
- Formatting and linting
- Session management

## Structure

*   **Entry Point:** `init.lua`
*   **Core Configuration:** `lua/charles/core/` (settings, keymaps)
*   **Plugin Manager:** `lua/charles/lazy.lua` (bootstraps `lazy.nvim`)
*   **Plugin Definitions:** `lua/charles/plugins/` (individual plugin specs, e.g., in `lua/charles/plugins/lsp/` for LSP)

## Customization

- General options: `lua/charles/core/options.lua`
- Key mappings: `lua/charles/core/keymaps.lua`
- Plugins: `lua/charles/plugins/`
- LSP configuration: `lua/charles/plugins/lsp/`

## Troubleshooting

If you encounter any issues:

1. Update Neovim to the latest version
2. Run `:checkhealth` within Neovim to diagnose problems
3. Update plugins with `:Lazy update`
