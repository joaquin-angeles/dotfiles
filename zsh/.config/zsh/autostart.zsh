# Autoload
autoload -U compinit && compinit

# New line after commands
precmd() {
    # Get the last executed command
    local last_command=$(fc -ln -1)

    # Exclude "clear" and "c"
    if [[ "$last_command" != "clear" && "$last_command" != "c" ]]; then
        echo
    fi
}

# Shell integrations
eval "$(fzf --zsh)"
eval "$(oh-my-posh init zsh --config '~/.config/zsh/omp.toml')"
eval "$(zoxide init zsh)"
