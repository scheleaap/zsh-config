# Plugins ######################################################################

_zshrc_plugin_install 'https://github.com/zsh-users/zsh-syntax-highlighting.git'
_zshrc_plugin_install 'https://github.com/zsh-users/zsh-history-substring-search.git'
#_zshrc_plugin_install 'https://github.com/scheleaap/docker-registry-cli.git'

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=default,fg=magenta,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=default,fg=black,bold'
HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS='i'

bindkey '^[[A' history-substring-search-up     # bind arrow-up
bindkey '^[[B' history-substring-search-down   # bind arrow-down

# zsh-completions ##############################################"################
_zshrc_plugin_install 'https://github.com/zsh-users/zsh-completions.git'
