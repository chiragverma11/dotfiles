#!/usr/bin/env zsh
#
# .zshenv - Zsh environment file, loaded always.
#

# XDG Variables
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

# ZSH Variables
export ZDOTDIR=${ZDOTDIR:-$HOME/.config/zsh}
export ZDATADIR=${ZDATADIR:-$XDG_DATA_HOME/zsh}
export ZCACHEDIR=${ZCACHEDIR:-$XDG_CACHE_HOME/zsh}

# Ensure path / fpath arrays exist and have unique attribute
typeset -gU path fpath

# Prepend user-local bins
path=($HOME/bin $HOME/.local/bin $path)

[[ -r "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"
