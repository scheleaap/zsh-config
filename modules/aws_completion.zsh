if [ -f /usr/bin/aws_completer ]; then
  autoload bashcompinit && bashcompinit
  complete -C /usr/bin/aws_completer aws
fi
