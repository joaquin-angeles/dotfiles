{ config, pkgs, ... }:

{
    home.username = "joaquin";
    home.homeDirectory = "/home/joaquin";
    programs.git.enable = true;
    home.stateVersion = "25.05";
    programs.zsh = {
        enable = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        initContent = "
        source ${pkgs.powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    alias bat='bat --color=always --theme=base16 --style=plain'
    alias c=clear
    alias ls=eza
    alias ll='eza -l'
    alias lla='eza -la'
    alias lsa='eza -a'
    alias lf=lfcd
    alias vim=nvim
    alias v=nvim
    alias grep=rg
    alias k=kill
    alias pk=pkill
    alias paru='paru --skipreview'
    alias paruf=~/.bin/parufzf
    alias flatpak='flatpak --user'
    alias nv-run='__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia'

    HISTSIZE=5000
    HISTFILE=~/.zsh_history
    SAVEHIST=$HISTSIZE
    HISTDUP=erase
    setopt appendhistory
    setopt sharehistory
    setopt hist_ignore_space
            ";
        powerlevel10k = {
            enable = true;
            instantPrompt = true;
        };
        shellInit = ''
    # Shell integrations
    eval "$(fzf --zsh)"
    eval "$(zoxide init zsh)"

    # Key bindings
    bindkey '^c' kill-whole-line
    bindkey '^a' beginning-of-line
    bindkey '^e' end-of-line
    bindkey '^j' history-search-forward
    bindkey '^k' history-search-backward
    bindkey '^r' fzf-history-widget

    # Set window titles
    precmd() {
        print -Pn "\e]0;%n@%m:%~\a"
    }

    # Lf file manager
    lfcd () {
        tmp="$(mktemp)"
        $HOME/.config/lf/lfrun -last-dir-path="$tmp" "$@"
        if [ -f "$tmp" ]; then
            dir="$(cat "$tmp")"
            rm -f "$tmp"
            if [ -d "$dir" ]; then
                cd "$dir"
            fi
        fi
    }

    # Compinit
    ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zcompdump"
    autoload -Uz compinit
    if [[ -n "$ZSH_COMPDUMP" && -f "$ZSH_COMPDUMP" ]]; then
        compinit -d "$ZSH_COMPDUMP"
    else
        compinit
    fi

    # Aliases
    alias bat='bat --color=always --theme=base16 --style=plain'
    alias c=clear
    cd() { z "$@" && eza; }
    alias fzf="fzf --preview '
    if [ -d {} ]; then
    eza -l --color=always {} || ls -la {}
    else
    bat --color=always --theme=base16 --style=plain {}
    fi
    '"
    alias flatpak='flatpak --user'
    alias grep=rg
    alias k=kill
    alias ls=eza
    alias lsa='eza -a'
    alias ll='eza -l'
    alias lla='eza -la'
    alias paru='paru --skipreview'
    alias paruf=~/.bin/parufzf
    alias pk=pkill
    alias vim=nvim
    alias v=nvim
    alias nv-run='__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia'

    # History
    HISTSIZE=5000
    HISTFILE=~/.zsh_history
    SAVEHIST=$HISTSIZE
    HISTDUP=erase
    setopt appendhistory
    setopt sharehistory
    setopt hist_ignore_space

    # P10K
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
        '';
    };

    xdg.configFile = builtins.mapAttrs
        (name: subpath: {
            source = create_symlink "${dotfiles}/${subpath}";
            recursive = true;
        })
        configs;

    home.packages = with pkgs; [
    ];

}
