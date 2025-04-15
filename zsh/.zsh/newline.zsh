precmd() {
  local last_cmd=$(fc -ln -1 | sed 's/^[ \t]*//;s/[ \t]*$//')
  if [[ $last_cmd != "clear" && $last_cmd != "c" ]]; then
    echo
  fi
}
