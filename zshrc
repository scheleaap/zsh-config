## Changing shell for User
# chsh -s /bin/zsh

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export VISUAL=/usr/bin/atom
export EDITOR="$VISUAL"
PATH=$PATH:~/bin/eclipse
PATH=$PATH:~/bin/apache-maven-3.3.9/bin
PATH=$PATH:~/bin/idea/bin
M2_HOME=~/bin/apache-maven-3.3.9

export ZSH_CONFIG_DIR="$(dirname $0)"
export ZSH_PLUGIN_DIR="$ZSH_CONFIG_DIR/plugins"
export ZSH_MODULE_DIR="$ZSH_CONFIG_DIR/modules"
export ZSH_FILE_DIR="$ZSH_CONFIG_DIR/files"

export LC_ALL="en_US.UTF-8"

bindkey -e # -e emacs mode -v for vi mode
bindkey ";5C" forward-word
bindkey ";5D" backward-word


# load helper module
source "$ZSH_CONFIG_DIR/helper.zsh"

# load plugins
source "$ZSH_CONFIG_DIR/plugins.zsh"

# load all modules
for module in $(find "$ZSH_MODULE_DIR" -type f -name '*.zsh'); do
  source $module
done
