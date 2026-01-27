# zsh-autosuggestions
# Accept suggestion with Alt-c
bindkey '^[c' autosuggest-accept

# sesh
zle     -N             sesh-sessions
bindkey -M emacs '\es' sesh-sessions
bindkey -M vicmd '\es' sesh-sessions
bindkey -M viins '\es' sesh-sessions
