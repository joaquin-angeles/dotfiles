# Zinit (Plugin Manager)
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
zinit light romkatv/powerlevel10k # P10K
zinit light zsh-users/zsh-syntax-highlighting # Syntax highlighting
zinit light zsh-users/zsh-completions # Autocompletion
zinit light zsh-users/zsh-autosuggestions # Suggesting past commands 

# Configurations
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh # P10K

sudo() {
  if ! /usr/bin/sudo -n true 2>/dev/null; then
    printf "[sudo] password for %s: 󰌾 \e[?25l" "$USER"
    command /usr/bin/sudo -p '' "$@"
    printf "\e[?25h"
  else
    command /usr/bin/sudo "$@"
  fi
}

cd() {
    z "$@" && eza
}
