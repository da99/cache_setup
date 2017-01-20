
source "$THIS_DIR"/bin/public/to-key/_.sh

# === {{CMD}}  "KEY"
read-or-empty () {
  local +x RAW_NAME="$1"; shift
  local +x KEY="$(to-key "$RAW_NAME")"
  redis-cli --raw get "$KEY"
} # === end function
