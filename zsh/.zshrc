# Auto-start
if [ -f /usr/bin/fastfetch ]; then
    fastfetch
    echo ''
fi
printf '\e[1 q'
stty intr '^G'

# P10K
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

# Binds 
bindkey '^C' kill-whole-line
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^J' history-search-forward
bindkey '^K' history-search-backward
bindkey '^R' fzf-history-widget

# Set window titles
precmd() {
    print -Pn "\e]0;%n@%m:%~\a"
}

# Compinit
ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zcompdump"
autoload -Uz compinit
if [[ -n "$ZSH_COMPDUMP" && -f "$ZSH_COMPDUMP" ]]; then
    compinit -d "$ZSH_COMPDUMP"
else
    compinit
fi

# Antidote plugin manager
source ~/.antidote/antidote.zsh
antidote load

# Aliases
alias bat='bat --color=always --theme=base16 --style=plain'
alias c=clear
cd() {
    z "$@" && eza
}
alias fzf="fzf --preview '
if [ -d {} ]; then
eza -l --color=always {} || ls -la {}
else
bat --color=always --theme=base16 --style=plain {}
fi
'"
alias ff=fastfetch
alias flatpak='flatpak --user'
alias grep=rg
alias k=kill
alias lf="$HOME/.config/lf/lfrun"
alias ls=eza
alias lsa='eza -a'
alias ll='eza -l'
alias lla='eza -la'
alias paru='paru --skipreview'
alias pacman='paru --skipreview'
alias pk=pkill
alias vim=nvim
alias yz=yazi

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
