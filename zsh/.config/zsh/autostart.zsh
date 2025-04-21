# P10K Instant Prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Window titles
function set_window_title() {
  local cmd="$1"
  local dir="${PWD/#$HOME/\~}"  # Replace $HOME with ~
  if [[ -n "$cmd" ]]; then
    # Show window title with the command executed
    print -Pn "\e]0;${USER}@${HOST}:${dir} (${cmd})\a"
  else
    # Show window title without parentheses when idle
    print -Pn "\e]0;${USER}@${HOST}:${dir}\a"
  fi
}

preexec() {
  set_window_title "$1"
}

precmd() {
  set_window_title ""
}

# Autoload
autoload -U compinit && compinit

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
