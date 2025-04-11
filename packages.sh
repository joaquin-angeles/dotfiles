#!/bin/bash

set -e  # Exit on error

# Ensure paru is installed
if ! command -v paru &>/dev/null; then
    echo "🔧 paru not found. Installing paru-bin..."
    temp_dir=$(mktemp -d)
    git clone https://aur.archlinux.org/paru-bin.git "$temp_dir"
    (
        cd "$temp_dir"
        makepkg -si --noconfirm
    )
    rm -rf "$temp_dir"
    echo "✅ paru installed successfully."
fi

# Sorted list of packages
packages=(
    flatpak
    hyprland
    hyprlock
    hyprpaper
    iwgtk
    kvantum
    kvantum-qt5
    libnotify
    mako
    nemo
    nemo-fileroller
    neovim
    pavucontrol
    waybar
    wlogout
    zoxide
    zsh
    zen-browser-bin
)

# Install each package if not already installed
for package in "${packages[@]}"; do
    if pacman -Q "$package" &>/dev/null; then
        echo "✅ $package is already installed."
    else
        echo "📦 Installing $package..."
        if paru -S --noconfirm "$package" &>/dev/null; then
            echo "✅ Successfully installed $package."
        else
            echo "❌ Failed to install $package." >&2
        fi
    fi
done
