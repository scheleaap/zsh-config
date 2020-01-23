function lines-from-file-from-to {
  if [[ "$#" -lt 3 ]]; then
    echo "Usage: $0 <from> <to> <file>"
    echo "Parameters:"
    echo "  from: inclusive, 0-based"
    echo "  to: exclusive, 0-based"
    return 1
  fi
  declare -i from="$1"
  declare -i to="$2"
  declare file="$3"
  #echo "$from $to $file"

  declare -i from_1_based="$((from + 1))"
  declare -i last_1_based="$to"
  declare -i next_1_based="$((to + 1))"
  local sed_string="${from_1_based},${last_1_based}p;${next_1_based}q"
  #echo $sed_string
  sed -n "$sed_string" "$file"
}

function lines-from-file-from-n {
  if [[ "$#" -lt 3 ]]; then
    echo "Usage: $0 <from> <n> <file>"
    echo "Parameters:"
    echo "  from: inclusive, 0-based"
    echo "  n: number of lines"
    return 1
  fi
  declare -i from="$1"
  declare -i n="$2"
  declare file="$3"
  declare -i to="$((from + n))"

  lines-from-file-from-to $from $to $file
}
