alias c=clear

cd() {
    z "$@" && eza
}

alias cat=bat

if [[ $TERM == "xterm-kitty" ]]; then
    alias ff='fastfetch --kitty-direct ~/.config/fastfetch/logo.png'
else
    alias ff='fastfetch --logo ~/.config/fastfetch/logo.txt'
fi

alias fzf="fzf --preview='bat {}'"

if [[ $TERM == "xterm-kitty" ]]; then
    alias fastfetch='fastfetch --kitty-direct ~/.config/fastfetch/logo.png'
else
    alias fastfetch='fastfetch --logo ~/.config/fastfetch/logo.txt'
fi

alias k=kill
alias ls='eza'
alias pk=pkill
alias x=exit
alias vim=nvim
