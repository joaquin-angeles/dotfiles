source ~/.config/zsh/autostart.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/history.zsh
source ~/.config/zsh/plugins.zsh

sudo() {
  # Check if sudo requires a password
  if ! /usr/bin/sudo -n true 2>/dev/null; then
    # Only show custom prompt if password is needed
    printf "[sudo] password for %s: 󰌾 \e[?25l" "$USER"
    
    # Run the actual sudo command with no internal prompt
    command /usr/bin/sudo -p '' "$@"
    
    # Restore cursor after password prompt
    printf "\e[?25h"
  else
    # If no password is needed, just run sudo normally
    command /usr/bin/sudo "$@"
  fi
}
