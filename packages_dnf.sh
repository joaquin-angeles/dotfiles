#!/bin/bash

set -e  # Exit on error

# Ensure dnf is available
if ! command -v dnf &>/dev/null; then
    echo " dnf not found. This script requires a DNF-based system (e.g., Fedora)."
    exit 1
fi

# Sorted list of packages in alphabetical order (adapted for Fedora/DNF)
packages=(
    dnf-plugins-core  # for `dnf copr`
    grim
    inotify-tools
    kvantum
    libnotify
    mako
    nemo
    nemo-fileroller
    neovim
    pavucontrol
    rofi
    rofi-emoji
    slurp
    swappy
    waybar
    wlogout
    zoxide
    zsh
)

# Extra packages from COPR or custom repos
declare -A copr_packages=(
    [hyprland]="copr:sergejf/hyprland"
    [hyprlock]="copr:sergejf/hyprland"
    [hyprpaper]="copr:sergejf/hyprland"
    [poweralertd]="copr:alepez/poweralertd"
    [rofi-wayland]="copr:copr.fedorainfracloud.org:principis:rofi-wayland"
)

# Enable COPR repos if needed
for pkg in "${!copr_packages[@]}"; do
    if ! rpm -q "$pkg" &>/dev/null; then
        echo " Enabling COPR for $pkg..."
        sudo dnf copr enable -y "${copr_packages[$pkg]}" &>/dev/null || true
    fi
done

# Install each package if not already installed
for package in "${packages[@]}" "${!copr_packages[@]}"; do
    if rpm -q "$package" &>/dev/null; then
        echo " $package is already installed."
    else
        echo " Installing $package..."
        if sudo dnf install -y "$package" &>/dev/null; then
            echo " Successfully installed $package."
        else
            echo " Failed to install $package." >&2
        fi
    fi
done

# Set Zsh as the default shell if not already set
if [ "$SHELL" != "/bin/zsh" ]; then
    echo "🔧 Setting zsh as the default shell..."
    chsh -s /bin/zsh &>/dev/null
    echo " zsh has been set as the default shell."
else
    echo " zsh is already the default shell."
fi
