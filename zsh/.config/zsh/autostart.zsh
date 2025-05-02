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
LAST_COMMAND=""

function preexec() {
    LAST_COMMAND="$1"
    set_window_title "$1"
}
function precmd() {
    set_window_title ""
    if [[ -n "$LAST_COMMAND" ]]; then
        case "$LAST_COMMAND" in
            clear|c) ;;
            *) print ;;
        esac
    fi
}

# Autoload
autoload -U compinit && compinit

# Shell integrations
eval "$(fzf --zsh)"
eval "$(oh-my-posh init zsh --config ~/.config/zsh/prompt.toml)"
eval "$(zoxide init zsh)"
