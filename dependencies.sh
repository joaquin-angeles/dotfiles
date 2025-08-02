#!/bin/bash

set -e

# AUR Setup
if ! grep -q "\[chaotic-aur\]" /etc/pacman.conf; then
    echo "󰖷 Setting up Chaotic AUR..."
    {
        sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
        sudo pacman-key --lsign-key 3056513887B78AEB
        sudo pacman -U --noconfirm --needed \
            'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' \
            'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
        echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf > /dev/null
        sudo pacman -Sy
    } &> /dev/null
echo " Chaotic AUR added successfully."
else
    echo "󰋑 Chaotic AUR is already configured."
fi
if ! command -v paru &> /dev/null; then
    echo "󰏗 Installing paru..."
    sudo pacman -S --noconfirm paru &> /dev/null
    echo -e " Successfully installed $package.\n"
else
    echo "󰋑 paru is already installed."
fi

# List of packages to install
packages=(
    bat
    bibata-cursor-theme
    brightnessctl
    chafa
    eza
    expect
    file-roller
    fish
    grim
    hyprland
    hyprlock
    hyprpaper
    inotify-tools
    kvantum
    kvantum-qt5
    lf
    libnotify
    mako
    nautilus
    neovim
    network-manager-applet
    nwg-displays
    nwg-look
    polkit-gnome
    qt5ct
    qt6ct
    rofi-emoji
    rofi-wayland
    slurp
    swayosd
    waybar
    wayfreeze-git
    wiremix
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    zen-browser-bin
    zoxide
)

# Install packages
for package in "${packages[@]}"; do
    if pacman -Q "$package" &>/dev/null; then
        echo "󰋑 $package is already installed."
    else
        echo -e "󰏗 Installing $package..."
        if paru -S --noconfirm --quiet "$package" &>/dev/null; then
            echo -e " Successfully installed $package.\n"

    # Enable services if needed
    case "$package" in
        auto-cpufreq)
            echo "󰈆 Enabling and starting hyprpolkitagent..."
            systemctl --user enable --now hyprpolkitagent.service &>/dev/null
            ;;
    esac
else
    echo " Failed to install $package." >&2
        fi
    fi
done

# Set zsh as the default shell if it's not already set
if [ "$SHELL" != "/usr/bin/zsh" ]; then
    echo "󰖷 Setting zsh as the default shell..."
    echo -n "[sudo] password for $USER: "
    chsh -s $(which zsh) &>/dev/null
    echo -e "\n  zsh has been set as the default shell."
else
    echo -e "󰋑 zsh is already the default shell."
fi
