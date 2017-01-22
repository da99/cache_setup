
# === {{CMD}}  # Exists 1 if Redis server not found.
ensure () {

  if ! type redis-cli &>/dev/null ; then
    echo "!!! Install redis."
    exit 1
  fi

  if [[ "$(redis-cli ping | :)" == "PONG" ]] ; then
    echo "!!! Redis server is not set up."
    exit 1
  fi

} # === end function
