#!/usr/bin/zsh
## Changing shell for User
# chsh -s /bin/zsh

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
if [ -x "$(command -v code)" ]; then
  export VISUAL=/usr/bin/code
elif [ -x "$(command -v atom)" ]; then
  export VISUAL=/usr/bin/atom
else
  export VISUAL=/usr/bin/joe
fi
export EDITOR="$VISUAL"

export ZSH_CONFIG_DIR="$(dirname $0)"
export ZSH_PLUGIN_DIR="$ZSH_CONFIG_DIR/plugins"
export ZSH_MODULE_DIR="$ZSH_CONFIG_DIR/modules"
export ZSH_FILE_DIR="$ZSH_CONFIG_DIR/files"

export LC_ALL="en_US.UTF-8"

bindkey -e # -e emacs mode -v for vi mode
bindkey ";5C" forward-word
bindkey ";5D" backward-word

setopt rm_star_silent

# extend path
if [ -f "$ZSH_CONFIG_DIR/path_local.zsh" ]; then
  source "$ZSH_CONFIG_DIR/path_local.zsh"
fi

# load helper module
source "$ZSH_CONFIG_DIR/helper.zsh"

# load plugins
source "$ZSH_CONFIG_DIR/plugins.zsh"

# load all modules
for module in $(find "$ZSH_MODULE_DIR" -type f -name '*.zsh'); do
  source $module
done
