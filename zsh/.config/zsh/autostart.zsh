# Autoload
autoload -U compinit && compinit

# New line after commands
typeset -g __has_prompted_once=false

precmd() {
    if [[ $__has_prompted_once == false ]]; then
        __has_prompted_once=true
        return
    fi

    local last_command=$(fc -ln -1)
    if [[ "$last_command" != "clear" && "$last_command" != "c" ]]; then
        echo
    fi
}

# Shell integrations
eval "$(fzf --zsh)"
eval "$(oh-my-posh init zsh --config '~/.config/zsh/omp.toml')"
eval "$(zoxide init zsh)"
