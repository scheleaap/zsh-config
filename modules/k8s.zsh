if [ -x "$(command -v kubectl)" ]; then
  source <(kubectl completion zsh)
fi
if [ -x "$(command -v stern)" ]; then
  source <(stern --completion zsh)
fi
