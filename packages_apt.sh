#!/bin/bash

set -e  # Exit on error

# Ensure apt is available
if ! command -v apt &>/dev/null; then
    echo " apt not found. This script requires a Debian/Ubuntu-based system."
    exit 1
fi

# Update package list
echo " Updating package list..."
sudo apt update -qq

# Sorted list of native packages
packages=(
    grim
    inotify-tools
    kvantum
    libnotify-bin
    mako-notifier
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

# Install packages from official repos
for package in "${packages[@]}"; do
    if dpkg -s "$package" &>/dev/null; then
        echo " $package is already installed."
    else
        echo " Installing $package..."
        if sudo apt install -y "$package" &>/dev/null; then
            echo " Successfully installed $package."
        else
            echo " Failed to install $package." >&2
        fi
    fi
done

# Install Hyprland + Hyprlock + Hyprpaper from source if not installed
install_hyprland() {
    echo " Installing Hyprland from source..."

    sudo apt install -y \
        git cmake meson ninja-build g++ wayland-protocols \
        libxkbcommon-dev libwayland-dev libxcb-composite0-dev \
        libxcb-xfixes0-dev libpixman-1-dev libxcb-render0-dev \
        libegl-dev libgles2-mesa-dev libdrm-dev libvulkan-dev \
        libinput-dev libudev-dev libseat-dev libxcb-icccm4-dev \
        libxcb-res0-dev libxcb-ewmh-dev libxcb-keysyms1-dev \
        libxcb-xinerama0-dev libpango1.0-dev libglib2.0-dev \
        libpam0g-dev libjpeg-dev libpng-dev libxcb-shape0-dev \
        libxcb-util-dev libxrender-dev libx11-dev libxcb1-dev \
        wayland-utils wlroots-dev libx11-xcb-dev libxcb-cursor-dev \
        xwayland &>/dev/null

    mkdir -p ~/dev && cd ~/dev
    if [ ! -d hyprland ]; then
        git clone https://github.com/hyprwm/Hyprland.git
    fi

    cd Hyprland
    make all -j$(nproc)
    sudo make install
    echo " Hyprland installed."
}

install_hyprpaper() {
    echo " Installing Hyprpaper..."
    cd ~/dev
    if [ ! -d hyprpaper ]; then
        git clone https://github.com/hyprwm/hyprpaper
    fi
    cd hyprpaper
    make all -j$(nproc)
    sudo make install
    echo " Hyprpaper installed."
}

install_hyprlock() {
    echo " Installing Hyprlock..."
    cd ~/dev
    if [ ! -d hyprlock ]; then
        git clone https://github.com/hyprwm/hyprlock
    fi
    cd hyprlock
    make all -j$(nproc)
    sudo make install
    echo " Hyprlock installed."
}

# Only install if Hyprland binary not found
if ! command -v Hyprland &>/dev/null; then
    install_hyprland
else
    echo " Hyprland is already installed."
fi

if ! command -v hyprpaper &>/dev/null; then
    install_hyprpaper
else
    echo " Hyprpaper is already installed."
fi

if ! command -v hyprlock &>/dev/null; then
    install_hyprlock
else
    echo " Hyprlock is already installed."
fi

# Set Zsh as default shell
if [ "$SHELL" != "/usr/bin/zsh" ]; then
    echo "🔧 Setting zsh as the default shell..."
    chsh -s /usr/bin/zsh &>/dev/null
    echo " zsh has been set as the default shell."
else
    echo " zsh is already the default shell."
fi
