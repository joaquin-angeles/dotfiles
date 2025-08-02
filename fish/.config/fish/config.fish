# Fish preferences
if status is-interactive
    set -g fish_greeting ""
    function cd
        z $argv && eza
    end
end

# Fetch
if test -f /usr/bin/fastfetch
    fastfetch
end

# Zoxide shell integrations
zoxide init fish | source

# Aliases
alias bat='bat --color=always --theme=base16 --style=plain'
alias cat='bat --color=always --theme=base16 --style=plain'
alias c='clear'
alias ff='fastfetch'
alias flatpak='flatpak --user'
alias grep='rg'
alias k='kill'
alias lf='~/.config/lf/lfrun'
alias ls='eza'
alias lsa='eza -a'
alias ll='eza -l'
alias lla='eza -la'
alias paru='paru --skipreview'
alias pacman='paru --skipreview'
alias pk='pkill'
alias vim='nvim'
