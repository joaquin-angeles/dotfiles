# Auto-start
if [ -f /usr/bin/fastfetch ]; then
    fastfetch
    echo ''
fi
stty intr '^G'

# P10K
source ~/.p10k/powerlevel10k.zsh-theme
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

# Binds 
bindkey '^c' kill-whole-line
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^j' history-search-forward
bindkey '^k' history-search-backward
bindkey '^r' fzf-history-widget

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

# Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

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
alias paruf=~/.bin/parufzf
alias pk=pkill
alias vim=nvim
alias v=nvim
alias nv-run='__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia'

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
