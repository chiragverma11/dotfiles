## Some tmux-related shell aliases

# Attaches tmux to the last session; creates a new session if none exists.
alias t='tmux attach || tmux new-session'

# Attaches tmux to a session (example: ta portal)
alias ta='tmux attach -t'

# Creates a new session
alias tn='tmux new-session'

# Lists all ongoing sessions
alias tl='tmux list-sessions'


## Aliases to fix blurry windows in wayland
alias code="code --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland"


## Aliases for lazygit
alias lg="lazygit"


## Aliases for sesh session manager
alias seshf="sesh connect \$(sesh list | fzf)"

## Alias ls to eza if eza is installed
if command -v eza > /dev/null 2>&1; then
    alias ls="eza"
    alias l.="eza -d .*"
    alias la="eza -a"
    alias lla="eza -la"
    alias ll="eza -l"
    unalias l 2>/dev/null
    unalias lsa 2>/dev/null
fi

## Fzf preview with bat
alias fpb="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

## General Aliases
alias c="clear"
alias open="xdg-open"
