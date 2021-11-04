if [ -x "$(command -v kubectl)" ]; then
  source <(kubectl completion zsh)
fi
if [ -x "$(command -v stern)" ]; then
  source <(stern --completion zsh)
fi
if [ -f /usr/bin/terraform ]; then
  autoload -U +X bashcompinit && bashcompinit
  complete -o nospace -C /usr/bin/terraform terraform
fi
