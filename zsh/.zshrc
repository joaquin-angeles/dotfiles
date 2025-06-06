# ──────────────────────────────
# Auto-start
# ──────────────────────────────
fastfetch
echo ''

# ──────────────────────────────
# P10K Instant Prompt
# ──────────────────────────────
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ──────────────────────────────
# Shell integrations
# ──────────────────────────────
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
source <(fzf --zsh)

# ──────────────────────────────
# Binds 
# ──────────────────────────────
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^k" kill-line
bindkey "^J" history-search-forward
bindkey "^K" history-search-backward
bindkey "^R" fzf-history-widget

# ──────────────────────────────
# Set window titles
# ──────────────────────────────
precmd() {
    print -Pn "\e]0;%n@%m:%~\a"
}

# ──────────────────────────────
# Zinit (Plugin Manager)
# ──────────────────────────────
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# ──────────────────────────────
# Snippets (Zinit)
# ──────────────────────────────
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# ──────────────────────────────
# Plugins (Zinit)
# ──────────────────────────────
zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search

# ──────────────────────────────
# Autoload
# ──────────────────────────────
autoload -U compinit && compinit

# ──────────────────────────────
# P10K configuration
# ──────────────────────────────
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ──────────────────────────────
# Aliases
# ──────────────────────────────
alias bat='bat --color=always --theme=base16 --style=plain'
alias cat='bat --color=always --theme=base16 --style=plain'
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
alias pk=pkill
alias swaybar='waybar -c ~/.config/waybar/sway/config.jsonc'
alias hyprbar='waybar -c ~/.config/waybar/hyprland/config.jsonc'
alias vim=nvim
alias yz=yazi

# ──────────────────────────────
# Package aliases
# ──────────────────────────────
alias pkg-add='sudo pacman -S'
alias pkg-search='pacman -Ss'
alias pkg-rm='sudo pacman -Rns'
alias pkg-sync='sudo pacman -Syu'
alias pkg-grep='pacman -Q'
alias pkg-info='pacman -Qi'
alias pkg-orphan='pacman -Qdt'
alias pkg-clean='sudo pacman -Rns $(pacman -Qdtq)'
alias pkg-files='pacman -Ql'
alias pkg-own='pacman -Qo'
# AUR
alias aur-add='paru --skipreview --aur -S'
alias aur-search='paru --skipreview --aur -Ss'
alias aur-sync='paru -Sua'

# ──────────────────────────────
# History
# ──────────────────────────────
HISTSIZE=5000
HISTFILE=~/.zhistory
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
