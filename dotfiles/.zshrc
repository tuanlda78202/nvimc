# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Set theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Configure plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search zsh-autocomplete)

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Load completions (remove if using zsh-autocomplete)
autoload -U compinit && compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Custom aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'

# Configure history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# UV setup (only if installed)
if command -v uv >/dev/null 2>&1; then
  eval "$(uv generate-shell-completion zsh)"
fi

# Source env file if it exists
if [[ -f $HOME/.local/bin/env ]]; then
  source $HOME/.local/bin/env
fi

# CUDA paths
export PATH="/usr/local/cuda-12.4/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda-12.4/lib64:$LD_LIBRARY_PATH"

# Cursor
function cursor {
  open -a "/Applications/Cursor.app" "$@"
}
