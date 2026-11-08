if [ -f /usr/bin/mise ]; then
    eval "$(/usr/bin/mise activate zsh)"
elif [ -f ~/.local/bin/mise ]; then
    eval "$(~/.local/bin/mise activate zsh)"
fi
