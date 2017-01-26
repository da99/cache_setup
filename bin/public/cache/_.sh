
# === {{CMD}}  X title cmd --with args
# === {{CMD}}  --quit title
cache () {
  mkdir -p "$THIS_DIR"/progs

  keep-running-file () {
    echo "$THIS_DIR"/progs/"$1".keep-running
  }

  if [[ "$1" == "--quit" ]]; then
    shift
    local +x TITLE="$1"
    rm -f "$(keep-running-file $TITLE)"
    return 0
  fi

  local +x NUM="$1"; shift
  local +x TITLE="$1"; shift
  local +x KEEP="$(keep-running-file $TITLE)"
  local +x FILE="$THIS_DIR"/progs/"$TITLE".txt

  touch "$KEEP"

  while [[ -f "$KEEP" ]]; do
    $@ > "$FILE".tmp
    sleep 1
    mv -f "$FILE".tmp "$FILE"
    sleep "$NUM"
  done

  cache --quit "$TITLE"
} # === end function
