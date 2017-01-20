
source "$THIS_DIR"/bin/public/to-key/_.sh

# === {{CMD}}  "KEY"  "VAL"
write () {
  local +x RAW_NAME="$1"; shift
  local +x VAL="$@"
  local +x KEY="$(to-key "$RAW_NAME")"
  if [[ -z "$KEY" ]]; then
    exit 1
  fi
  redis-cli set "$KEY" "$VAL" >/dev/null
} # === end function
