#!/usr/bin/env zsh

# Profiling
[[ "$ZPROFRC" -ne 1 ]] || zmodload zsh/zprof
alias zprofrc="ZPROFRC=1 zsh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# DISABLE_MAGIC_FUNCTIONS=true
# ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Lazy-load (autoload) Zsh function files from a directory.
ZFUNCDIR=$ZDOTDIR/functions
fpath=($ZFUNCDIR $fpath)
autoload -Uz $ZFUNCDIR/*(.:t)

# Load completions
fpath=($ZDOTDIR/completions $fpath)

# Set any zstyles you might use for configuration.
[[ ! -f $ZDOTDIR/.zstyles ]] || source $ZDOTDIR/.zstyles

# Clone antidote if necessary.
if [[ ! -d $ZDATADIR/antidote ]]; then
  git clone https://github.com/mattmc3/antidote $ZDATADIR/antidote
fi

# Create an amazing Zsh config using antidote plugins.
source $ZDATADIR/antidote/antidote.zsh
antidote load

# Prompt customization
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
  export VISUAL='vim'
else
  export EDITOR='nvim'
  export VISUAL='nvim'
fi

# Load all files from $ZDOTDIR/zsh.d
for ZSH_FILE in $ZDOTDIR/zsh.d/*.zsh(N); do
    source "$ZSH_FILE"
done

# Shell Integrations
eval "$(zoxide init --cmd cd zsh)"
if (( $+commands[fzf] )); then
    source <(fzf --zsh)
fi

# SSH configuration
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# PNPM configuration
export PNPM_HOME="/home/chirag/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Java configuration
[[ -x $(command -v java) ]] && export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::")

# Spicetify configuration
export PATH=$PATH:/home/chirag/.spicetify

# Load local configuration (keep this at the end)
if [[ -r "$ZDOTDIR/.zshrc.local" ]]; then
  source "$ZDOTDIR/.zshrc.local"
fi

# opencode
export PATH=/home/chirag/.opencode/bin:$PATH

# Finish profiling by calling zprof.
[[ "$ZPROFRC" -eq 1 ]] && zprof
[[ -v ZPROFRC ]] && unset ZPROFRC
