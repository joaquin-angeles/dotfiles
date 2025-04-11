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

# Sorted list of packages in alphabetical order
packages=(
    hyprland
    hyprlock
    hyprpaper
    kvantum
    kvantum-qt5
    libnotify
    mako
    nemo
    nemo-fileroller
    neovim
    pavucontrol
    rofi-wayland
    waybar
    wlogout
    zoxide
    zsh
)

# Sort the packages alphabetically
packages=($(for pkg in "${packages[@]}"; do echo "$pkg"; done | sort))

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

# Set Zsh as the default shell if not already set
if [ "$SHELL" != "/usr/bin/zsh" ]; then
    echo "🔧 Setting Zsh as the default shell..."
    chsh -s /usr/bin/zsh
    echo "✅ Zsh has been set as the default shell."
else
    echo "✅ Zsh is already the default shell."
fi
