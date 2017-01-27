
# === {{CMD}} file key
get () {
  local +x FILE="$1"; shift
  local +x KEY="$1"; shift

  if [[ ! -e "$FILE" ]]; then
    echo "!!! File does not exist: $FILE" >&2
    exit 1
  fi

  local +x VAL="$(awk '/^'$KEY': +([^\n]+)/{print $2}' "$FILE")"
  if [[ ! -z "$VAL" ]]; then
    echo $VAL
    return 0
  fi

  local +x KEY_FOUND="$(awk -F':' '/^('$KEY'):/{print $1}' "$FILE")"
  if [[ "$KEY_FOUND" == "$KEY" ]]; then
    return 0
  fi

  echo "!!! Key not found: $KEY $@"
  exit 1
} # === end function
