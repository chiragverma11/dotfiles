# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Update PATH
export PATH=$HOME/bin:$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$XDG_DATA_HOME/oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Oh-My-Zsh Plugins
plugins=(git aliases zsh-autosuggestions fast-syntax-highlighting zsh-autocomplete fzf-tab)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Prompt customization
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

# https://github.com/zsh-users/zsh-autosuggestions/issues/238#issuecomment-389324291
# This speeds up pasting w/ autosuggest
# Disable zsh-autocompletion on paste
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish paste-finish

# https://github.com/zsh-users/zsh-autosuggestions/issues/351#issuecomment-1116146362
DISABLE_MAGIC_FUNCTIONS=true

# History
HISTSIZE=10000
HISTFILE="${ZDATADIR}/.zsh_history"
SAVEHIST=$HISTSIZE
setopt append_history share_history hist_ignore_space hist_ignore_all_dups

# Completion styling
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Load custom keybindings, aliases and functions
source "$ZDOTDIR/keybinds.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/functions.zsh"

# Shell Integrations
eval "$(zoxide init --cmd cd zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# PNPM configuration
export PNPM_HOME="/home/chirag/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Java configuration
export JAVA_HOME="$HOME/.jdks/openjdk-22.0.1"
export PATH="$JAVA_HOME/bin:$PATH"

# Spicetify configuration
export PATH=$PATH:/home/chirag/.spicetify
