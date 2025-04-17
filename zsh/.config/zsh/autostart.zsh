# Kitty configurations
# if [[ $TERM == "xterm-kitty" ]]; then
#   kitty @ set-spacing padding=6
# fi

if [[ $TERM == "xterm-kitty" ]]; then
    fastfetch --kitty-direct ~/.config/fastfetch/logo.png
else
    fastfetch --logo ~/.config/fastfetch/logo.txt
fi

# Autoload
autoload -U compinit && compinit

# New line after commands
precmd() {
  local last_cmd=$(fc -ln -1 | sed 's/^[ \t]*//;s/[ \t]*$//')
  if [[ $last_cmd != "clear" && $last_cmd != "c" ]]; then
    echo
  fi
}

# Shell integrations
eval "$(fzf --zsh)"
eval "$(oh-my-posh init zsh --config '~/.config/zsh/omp.toml')"
eval "$(zoxide init zsh)"
