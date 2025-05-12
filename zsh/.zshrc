# Autoload
autoload -U compinit && compinit
printf '\e[1 q'
fastfetch
echo ''

# P10K Instant Prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

# Set window titles
preexec() {
    set_window_title "$1"
}
precmd() {
    set_window_title ""
}
excluded_commands=("git commit" "git add" "clear" "c" "ls" "pwd" "exit" "history" "fastfetch" "ff" "pkill" "pk" "sleep")
function set_window_title() {
    local cmd="$1"
    local dir="${PWD/#$HOME/\~}"
    if [[ "$cmd" =~ ^\  ]]; then
        return 0
    fi
    for excluded in "${excluded_commands[@]}"; do
        if [[ "$cmd" == "$excluded"* ]]; then
            return 0
        fi
    done
    if [[ -n "$cmd" ]]; then
        print -Pn "\e]0;${USER}@${HOST}:${dir} (${cmd})\a"
    else
        print -Pn "\e]0;${USER}@${HOST}:${dir}\a"
    fi
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
zinit light zsh-users/zsh-completions # Auto-completion
zinit light zsh-users/zsh-autosuggestions # Auto-suggest past commands 

# P10K configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Aliases
alias c=clear
cd() {
    z "$@" && eza
}
alias ff=fastfetch
alias fzf="fzf --preview 'cat {}'"
alias flatpak='flatpak --user'
alias grep=rg
alias k=kill
alias lf='~/.config/lf/lfrun'
alias ls=eza
alias lsa='eza -a'
alias ll='eza -l'
alias lla='eza -la'
alias paru='paru --skipreview'
alias pk=pkill
alias vim='nvim'
alias view='swayimg'

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
