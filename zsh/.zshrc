# Kitty configurations
if [[ $TERM == "xterm-kitty" ]]; then
  kitty @ set-spacing padding=6
fi

if [[ $TERM == "xterm-kitty" ]]; then
    fastfetch --kitty-direct ~/.config/fastfetch/logo.png
else
    fastfetch --logo ~/.config/fastfetch/logo.txt
fi

preexec() {
  echo
}
precmd() {
  local last_cmd=$(fc -ln -1 | sed 's/^[ \t]*//;s/[ \t]*$//')
  if [[ $last_cmd != "clear" && $last_cmd != "c" ]]; then
    echo
  fi
}

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
eval "$(oh-my-posh init zsh --config '~/.config/omp.toml')"
eval "$(zoxide init zsh)"

# Aliases
alias c=clear
cd() {
    z "$@" && eza
}
alias cat=bat
alias ff='fastfetch --kitty-direct ~/.config/fastfetch/logo.png'
alias fzf="fzf --preview='bat {}'"
alias fastfetch='fastfetch --kitty-direct ~/.config/fastfetch/logo.png'
alias k=kill
alias ls='eza'
alias pk=pkill
alias x=exit
alias vim=nvim
