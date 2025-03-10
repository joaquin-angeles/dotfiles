# Created by newuser for 5.9
fastfetch

export EDITOR=nvim
export VISUAL=nvim

export XDG_CONFIG_HOME="$HOME/.files/.config"
export QT_STYLE_OVERRIDE=kvantum
export GTK_THEME="MonoThemeDark"
export XDG_DESKTOP_PORTAL=hyprland
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_TYPE=wayland

alias superman='sudo pacman'
alias dotfiles='git --git-dir=$HOME/.files --work-tree=$HOME'
alias fzf="fzf --preview='cat {}'"
alias konsole='kitty'
alias exa='exa --icons'
alias vim="nvim"
alias undertale=~/.config/undertale_remap.sh
eval "$(starship init zsh)"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

cd() {
    builtin cd "$@" && exa --icons
}
