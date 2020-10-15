if [ -d ~/.pyenv/bin ]; then
  PATH=~/.pyenv/bin:$PATH;
  eval "$(pyenv init -)"
fi
