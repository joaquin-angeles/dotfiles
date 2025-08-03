# Auto-start
if [ -f /usr/bin/fastfetch ]; then
    fastfetch
    echo ''
fi
printf '\e[1 q'
stty intr '^G'

# P10K Instant Prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
source <(fzf --zsh)

# Binds 
bindkey '^C' kill-whole-line
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^J" history-search-forward
bindkey "^K" history-search-backward
bindkey "^R" fzf-history-widget

# Set window titles
precmd() {
    print -Pn "\e]0;%n@%m:%~\a"
}

# Autoload
autoload -Uz compinit && compinit

# Plugins
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fpath=(~/.zsh/plugins/completions/src $fpath)
source ~/.zsh/plugins/p10k/powerlevel10k.zsh-theme
source ~/.zsh/plugins/syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/plugins/autosuggestions/zsh-autosuggestions.zsh

# Aliases
alias bat='bat --color=always --theme=base16 --style=plain'
alias c=clear
cd() {
    z "$@" && eza
}
alias fzf="command fzf --preview '
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
alias lf=~/.config/lf/lfrun
alias ls=eza
alias lsa='eza -a'
alias ll='eza -l'
alias lla='eza -la'
alias paru='paru --skipreview'
alias pacman='paru --skipreview'
alias pk=pkill
alias swaybar='waybar -c ~/.config/waybar/sway/config.jsonc'
alias hyprbar='waybar -c ~/.config/waybar/hyprland/config.jsonc'
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
