
# === {{CMD}} key file
get-or-empty () {
  local +x KEY="$1"; shift
  local +x FILE="$1"; shift

  if [[ ! -e "$FILE" ]]; then
    echo "!!! File does not exist: $FILE" >&2
    exit 1
  fi

  sed -n -e 's/'$KEY':\ \+\(.\+\)/\1/p' "$FILE"
} # === end function
