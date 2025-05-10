fastfetch
echo ''

# P10K Instant Prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# List of commands to exclude from updating the window title
excluded_commands=("git commit" "git add" "clear" "c" "ls" "pwd" "exit" "history" "fastfetch" "ff" "pkill" "pk" "sleep")

# Function to set the terminal window title
function set_window_title() {
    local cmd="$1"
    local dir="${PWD/#$HOME/\~}"  # Replace $HOME with ~

    # Check if the command starts with a space (to exclude it)
    if [[ "$cmd" =~ ^\  ]]; then
        return 0  # Skip updating the title if the command starts with a space
    fi

    # Check if the command is in the excluded list
    for excluded in "${excluded_commands[@]}"; do
        if [[ "$cmd" == "$excluded"* ]]; then
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

# Update title before executing a command
preexec() {
    set_window_title "$1"
}

precmd() {
    set_window_title ""
}

# Autoload
autoload -U compinit && compinit
printf '\e[1 q'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

# List of commands to exclude from updating the window title
excluded_commands=("git commit" "git add" "clear" "c" "ls" "pwd" "exit" "history" "fastfetch" "ff" "pkill" "pk" "sleep")

# Function to set the terminal window title
function set_window_title() {
    local cmd="$1"
    local dir="${PWD/#$HOME/\~}"  # Replace $HOME with ~

    # Check if the command starts with a space (to exclude it)
    if [[ "$cmd" =~ ^\  ]]; then
        return 0  # Skip updating the title if the command starts with a space
    fi

    # Check if the command is in the excluded list
    for excluded in "${excluded_commands[@]}"; do
        if [[ "$cmd" == "$excluded"* ]]; then
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

# Window title configurations and newline
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

# P10K configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Aliases
alias c=clear
cd() {
    z "$@" && eza
}
alias ff=fastfetch
alias flatpak='flatpak --user'
alias grep=rg
alias k=kill
alias lf='sh ~/.config/lf/lfrun'
alias ls=eza
alias paru='paru --skipreview'
alias pk=pkill
alias vim='nvim'
alias vi='nvim'
