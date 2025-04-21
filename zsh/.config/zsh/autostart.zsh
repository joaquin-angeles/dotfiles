# P10K Instant Prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# List of commands to exclude from updating the window title
excluded_commands=("git commit" "git add" "clear" "c" "ls" "pwd" "exit" "history")

# Function to set the terminal window title
function set_window_title() {
  local cmd="$1"
  local dir="${PWD/#$HOME/\~}"  # Replace $HOME with ~
  
  # Check if the command matches any of the excluded commands
  for excluded in "${excluded_commands[@]}"; do
    # Use a regular expression to check if the base command matches
    if [[ "$cmd" =~ ^$excluded ]]; then
      return 0  # Skip updating the title if it's an excluded command
    fi
  done
  
  # Show window title with the command executed (only if not excluded)
  if [[ -n "$cmd" ]]; then
    print -Pn "\e]0;${USER}@${HOST}:${dir} (${cmd})\a"
  else
    # Show window title without parentheses when idle
    print -Pn "\e]0;${USER}@${HOST}:${dir}\a"
  fi
}

# Update title before executing a command (ensure the command and arguments are passed)
preexec() {
  set_window_title "$1"  # Pass the command (and its arguments) to the function
}

# Reset title after executing a command
precmd() {
  set_window_title ""  # No command title when idle
}

# Autoload
autoload -U compinit && compinit

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
