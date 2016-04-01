function find-ls {

  if [[ "$1" = "--help" ]]; then
    echo "Usage: find_ls find_args [--ls ls_args]"
    return
  fi

  function index {
    index=0;
    for arg in ${@:2}; do
      index=$(expr $index + 1)
      if [[ "$arg" = "$1" ]]; then
        echo $index;
        return
      fi
    done
    echo 0;
  }

  find_args=($@)
  ls_args=

  ls_args_seperator_index=$(index "--ls" $@)
  if [ $ls_args_seperator_index -gt 0 ]; then
    find_args=(${@:1:$(expr $ls_args_seperator_index - 1)})
    ls_args=(${@:$(expr $ls_args_seperator_index + 1)})
  fi

  ls $ls_args -d $(/usr/bin/find $find_args)
}