alias c=clear

cd() {
    z "$@" && eza
}

if [[ $TERM == "xterm-kitty" ]]; then
    alias ff='fastfetch --kitty-direct ~/.config/fastfetch/logo.png'
else
    alias ff='fastfetch'
fi

if [[ $TERM == "xterm-kitty" ]]; then
    alias fastfetch='fastfetch --kitty-direct ~/.config/fastfetch/logo.png'
fi

alias grep=rg
alias k=kill
alias ls='eza'
alias pk=pkill
alias x=exit
alias vim=nvim
