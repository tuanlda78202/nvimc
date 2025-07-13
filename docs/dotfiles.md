# Dotfiles Configuration

- [tmux Configuration (.tmux.conf)](#tmux-configuration-tmuxconf)
- [Zsh Configuration (.zshrc)](#zsh-configuration-zshrc)
- [System Header Script (header)](#system-header-script-header)
- [Installation and Setup](#installation-and-setup)
- [Dependencies](#dependencies)

## tmux Configuration (.tmux.conf)

### Key Features

- **Custom prefix key**: `Ctrl-a` (instead of default `Ctrl-b`)
- **Intuitive pane splitting**: `|` for horizontal, `-` for vertical splits
- **Vi-style copy mode**: Enhanced clipboard integration with macOS
- **Pane navigation**: Vim-style `hjkl` keys for pane movement
- **Pane resizing**: Arrow keys with repeat capability
- **Mouse support**: Enabled for modern terminal interaction

### Key Bindings

| Key Combination | Action |
|---|---|
| `Ctrl-a` | Prefix key |
| `Ctrl-a + Shift ~` | Split window horizontally |
| `Ctrl-a -` | Split window vertically |
| `Ctrl-a r` | Reload tmux config |
| `Ctrl-a h/j/k/l` | Navigate panes (left/down/up/right) |
| `Ctrl-a Arrow` | Resize panes |

### Copy Mode

- **Vi-style keybindings**: `v` to select, `y` to copy
- **macOS clipboard**: Automatic integration with `pbcopy`
- **Mouse selection**: Drag to select and copy

## Zsh Configuration (.zshrc)

### Theme and Appearance

- **Theme**: Powerlevel10k with instant prompt
- **Prompt customization**: Available via `p10k configure`

### Plugin System

The configuration includes several productivity-enhancing plugins:

- **`git`**: Git integration and aliases
- **`zsh-autosuggestions`**: Command suggestions based on history
- **`zsh-syntax-highlighting`**: Syntax highlighting for commands
- **`zsh-history-substring-search`**: Enhanced history search
- **`zsh-autocomplete`**: Advanced tab completion

### Custom Aliases

```bash
alias ll='ls -alF'     # Long listing with file types
alias la='ls -A'       # List all files except . and ..
alias l='ls -CF'       # List in columns with file types
alias ..='cd ..'       # Go up one directory
alias ...='cd ../..'   # Go up two directories
```

### Environment Configuration

- **History**: 10,000 commands stored in `~/.zsh_history`
- **UV integration**: Python package manager completion (if installed)
- **CUDA paths**: GPU development environment setup
- **Cursor function**: Quick launcher for Cursor editor

### External Dependencies

- **Oh My Zsh**: Framework for Zsh configuration
- **Powerlevel10k**: Theme for enhanced prompt
- **UV**: Optional Python package manager
- **CUDA**: Optional GPU development toolkit

## System Header Script (header)

A custom MOTD (Message of the Day) script that displays comprehensive system information with ASCII art branding.

### Features

- **ASCII Art**: Custom name branding
- **System Information**: Comprehensive hardware and software details
- **Color-coded Output**: Green, cyan, and yellow highlighting
- **GPU Detection**: Automatic detection of NVIDIA, AMD, or Intel graphics

### Information Displayed

| Category | Details |
|---|---|
| **System** | Hostname, kernel version, uptime |
| **Hardware** | CPU model, memory usage, disk usage |
| **Performance** | CPU usage, system load average |
| **Network** | Local IP address, public IP address |
| **Graphics** | GPU model and vendor |
| **User** | Current user information |

### Usage

This script is designed to be used as a system login banner. It can be:

- Placed in `/etc/update-motd.d/` for system-wide MOTD
- Executed manually to display system information
- Integrated into shell profiles for login display

## Installation and Setup

### tmux Configuration

```bash
# Copy configuration to home directory
cp dotfiles/.tmux.conf ~/.tmux.conf

# Reload tmux configuration
tmux source-file ~/.tmux.conf
```

### Zsh Configuration

```bash
# Install Oh My Zsh (if not already installed)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete

# Copy configuration
cp dotfiles/.zshrc ~/.zshrc

# Reload shell
source ~/.zshrc
```

### Header Script

```bash
# For system-wide MOTD (requires sudo)
sudo cp dotfiles/header /etc/update-motd.d/01-custom-header
sudo chmod +x /etc/update-motd.d/01-custom-header

# For personal use
cp dotfiles/header ~/.local/bin/header
chmod +x ~/.local/bin/header
```

## Dependencies

### Required

- **tmux**: Terminal multiplexer
- **zsh**: Z shell
- **git**: Version control system

### Optional

- **Oh My Zsh**: Zsh framework
- **Powerlevel10k**: Zsh theme
- **UV**: Python package manager
- **CUDA**: GPU development toolkit
- **nvidia-smi**: NVIDIA GPU management tool
- **curl**: HTTP client (for public IP detection)

### System Compatibility

- **macOS**: Full support with `pbcopy` integration
- **Linux**: Full support with standard tools
- **Windows**: Partial support via WSL

## Customization

### tmux

- Edit `~/.tmux.conf` to modify keybindings or colors
- Reload with `Ctrl-a r` or `tmux source-file ~/.tmux.conf`

### Zsh

- Run `p10k configure` to customize the prompt
- Edit `~/.zshrc` to add aliases or modify plugins
- Reload with `source ~/.zshrc`

### Header

- Modify ASCII art by editing the `cat << 'ASCII'` section
- Customize information display by editing the printf statements
- Adjust colors by modifying the color escape sequences
