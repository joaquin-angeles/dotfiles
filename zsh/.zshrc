if command -v fastfetch >/dev/null 2>&1; then
  fastfetch
  echo ''
fi

# Unbinding
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

# Lf file manager
lfcd () {
  tmp="$(mktemp)"
  $HOME/.config/lf/lfrun -last-dir-path="$tmp" "$@"
  if [ -f "$tmp" ]; then
    dir="$(cat "$tmp")"
    rm -f "$tmp"
    if [ -d "$dir" ]; then
      cd "$dir"
    fi
  fi
}
alias lf=lfcd

# Compinit
ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zcompdump"
autoload -Uz compinit
if [[ -n "$ZSH_COMPDUMP" && -f "$ZSH_COMPDUMP" ]]; then
  compinit -d "$ZSH_COMPDUMP"
else
  compinit
fi

# Aliases
alias bat='bat --color=always --theme=base16 --style=plain'
alias c=clear
alias flatpak='flatpak --user'
alias fzf="fzf --preview '
if [ -d {} ]; then
  eza -l --color=always {} || ls -la {}
else
  bat --color=always --theme=base16 --style=plain {}
fi
'"
alias grep=rg
alias k=kill
alias lsa='eza -a'
alias ll='eza -l'
alias lla='eza -la'
alias ls=eza
alias nv-run='__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia'
alias paru='paru --skipreview'
alias paruf=~/.bin/parufzf
alias pk=pkill
alias vim=nvim
alias v=nvim
alias nix-shell='nix-shell --run $SHELL'
cd() {
  z "$@" && eza
}
nix() {
  if [[ $1 == "develop" ]]; then
    shift
    command nix develop -c $SHELL "$@"
  else
    command nix "$@"
  fi
}

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
