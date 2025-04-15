# Kitty configurations
if [[ $TERM == "xterm-kitty" ]]; then
  kitty @ set-spacing padding=6
fi

if [[ $TERM == "xterm-kitty" ]]; then
    fastfetch --kitty-direct ~/.config/fastfetch/logo.png
else
    fastfetch --logo ~/.config/fastfetch/logo.txt
fi

# Autoload
autoload -U compinit && compinit

# Shell integrations
eval "$(fzf --zsh)"
eval "$(oh-my-posh init zsh --config '~/.config/omp.toml')"
eval "$(zoxide init zsh)"
