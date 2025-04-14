# Kitty configurations
if [[ $TERM == "xterm-kitty" ]]; then
  kitty @ set-spacing padding=6
fi

if [[ $TERM == "xterm-kitty" ]]; then
    fastfetch --kitty-direct ~/.config/fastfetch/logo.png
else
    fastfetch --logo ~/.config/fastfetch/logo.txt
fi

# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Plugin manager (Zinit)
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Snippets (Zinit)
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# Plugins (Zinit)
zinit ice depth=1;zinit light romkatv/powerlevel10k # P10K
zinit light zsh-users/zsh-syntax-highlighting # Syntax highlighting
zinit light zsh-users/zsh-completions # Autocompletion
zinit light zsh-users/zsh-autosuggestions # Suggesting past commands 

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space

# Autoload
autoload -U compinit && compinit

# Shell integrations
eval "$(fzf --zsh)"
# eval "$(oh-my-posh init zsh --config '~/.config/omp.toml')"
eval "$(zoxide init zsh)"

# Aliases
alias c=clear
cd() {
    z "$@" && eza
}
alias ff='fastfetch --kitty-direct ~/.config/fastfetch/logo.png'
alias fzf="fzf --preview='bat {}'"
alias fastfetch='fastfetch --kitty-direct ~/.config/fastfetch/logo.png'
alias k=kill
alias ls='eza'
alias pk=pkill
alias x=exit
alias vim=nvim

# P10K configuration. (p10k configure)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
