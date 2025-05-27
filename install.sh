#!/bin/bash

set -euo pipefail

DOTFILES_DIR="$HOME/.dotfiles"
MODULES=(
    hypr
    waybar
    mako
    scripts
    wallpapers
    foot
    neovim
    rofi
    themes
)

cd "$DOTFILES_DIR"

echo " Installing dotfiles with GNU Stow..."

for module in "${MODULES[@]}"; do
    if [ -d "$module" ]; then
        echo "󰏗 Stowing $module..."
        if stow "$module"; then
            echo " Successfully stowed $module."
        else
            echo " Failed to stow $module." >&2
        fi
    else
        echo " Skipping missing module: $module"
    fi
done
