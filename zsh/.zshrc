sleep 0.01
fastfetch

# UWSM
if uwsm check may-start && uwsm select; then
    exec systemd-cat -t uwsm_start uwsm start default
fi

# P10K
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
# autoload -U compinit && compinit
# zinit replay -q

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

# Environment variables
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

# Aliases
alias r='reboot'
alias cat=bat
alias c=clear
alias k=kill
alias pk=pkill
alias prime-run='env __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia __VK_LAYER_NV_optimus=NVIDIA_only'
alias superman='sudo pacman'
alias dotfiles='git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias fzf="fzf --preview='bat {}'"
alias xa='exa --icons'
alias vim=nvim

# Directory change improvements
cd() {
    z "$@" && exa --icons
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
