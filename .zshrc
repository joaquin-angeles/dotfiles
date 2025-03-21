# Created by newuser for 5.9
fastfetch

export __GLX_VENDOR_LIBRARY_NAME=nvidia
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/nvidia_icd.json
export VK_LAYER_PATH=/usr/share/vulkan/explicit_layer.d

export EDITOR=nvim
export VISUAL=nvim

export XCURSOR_THEME="Bibata-Modern-Classic"
export XCURSOR_SIZE=24
export GTK_THEME="MonoThemeDark"
export XDG_DESKTOP_PORTAL=hyprland
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_TYPE=wayland

alias spotify=spotify_player
alias nvidia-run='env __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia __VK_LAYER_NV_optimus=NVIDIA_only'
alias superman='sudo pacman'
alias dotfiles='git --git-dir=$HOME/.files --work-tree=$HOME'
alias fzf="fzf --preview='cat {}'"
alias konsole='kitty'
alias exa='exa --icons'
alias vim=nvim
alias undertale=~/.config/undertale_remap.sh
eval "$(starship init zsh)"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

cd() {
    builtin cd "$@" && exa --icons
}
export PATH=/home/joaquin/.local/bin:/sbin:/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/var/lib/flatpak/exports/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/opt/rocm/bin
