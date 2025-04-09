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

# Install Rubik font from the official Google Fonts repository
echo "🔧 Installing Rubik font..."
font_dir="$HOME/.local/share/fonts"
mkdir -p "$font_dir"
git clone --depth 1 https://github.com/googlefonts/rubik.git "$font_dir/rubik-font"

# Copy the TTF files from the variable directory into the fonts directory
cp -r "$font_dir/rubik-font/fonts/variable"/*.ttf "$font_dir"

# Delete the rubik-font directory after moving the TTFs
rm -rf "$font_dir/rubik-font"
# Update font cache silently
fc-cache -fv &>/dev/null
echo "✅ Rubik font installed successfully and rubik-font directory removed."

# Install JetBrains Mono Nerd Font and Apple Emojis font
echo "🔧 Installing additional fonts..."
paru -S --noconfirm ttf-jetbrains-mono-nerd &>/dev/null
paru -S --noconfirm ttf-jetbrains-mono &>/dev/null
paru -S --noconfirm ttf-apple-emoji &>/dev/null

# Update font cache silently
fc-cache -fv &>/dev/null
echo "✅ Fonts installed successfully."

# Apply Rubik font for GNOME (using gsettings)
echo "🔧 Applying Rubik font to GNOME settings..."
gsettings set org.gnome.desktop.interface font-name 'Rubik 13' &>/dev/null

# Apply JetBrainsMono Nerd Font Mono as monospace font in Fontconfig
echo "🔧 Applying JetBrains Mono Nerd Font Mono for monospace..."
fontconfig_dir="$HOME/.config/fontconfig"
mkdir -p "$fontconfig_dir"

if [ ! -f "$fontconfig_dir/fonts.conf" ]; then
    echo "🔧 Creating fonts.conf file for Fontconfig..."
    cat > "$fontconfig_dir/fonts.conf" <<EOF
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <match target="pattern">
    <test name="family">
      <string>monospace</string>
    </test>
    <edit name="family" mode="assign">
      <string>JetBrainsMono Nerd Font Mono</string>
    </edit>
  </match>
  <match target="pattern">
    <test name="family">
      <string>emoji</string>
    </test>
    <edit name="family" mode="assign">
      <string>Apple Color Emoji</string>
    </edit>
  </match>
</fontconfig>
EOF
    echo "✅ fonts.conf file created."
fi

# Install qt5ct and qt6ct if not already installed
if ! command -v qt5ct &>/dev/null; then
    echo "🔧 qt5ct not found. Installing qt5ct..."
    paru -S --noconfirm qt5ct &>/dev/null
    echo "✅ qt5ct installed successfully."
fi

if ! command -v qt6ct &>/dev/null; then
    echo "🔧 qt6ct not found. Installing qt6ct..."
    paru -S --noconfirm qt6ct &>/dev/null
    echo "✅ qt6ct installed successfully."
fi

# Apply Rubik font for Qt applications
echo "🔧 Applying Rubik font to Qt applications..."
if command -v qt5ct &>/dev/null; then
    qt5ct --set-font "Rubik" &>/dev/null
elif command -v qt6ct &>/dev/null; then
    qt6ct --set-font "Rubik" &>/dev/null
else
    echo "⚠️ qtct not found. Please install qt5ct or qt6ct for Qt font configuration."
fi

# Sorted list of packages
packages=(
    hyprlock
    hyprpaper
    iwgtk
    kvantum
    kvantum-qt5
    nemo
    nemo-fileroller
    neovim
    pavucontrol
    waybar
    wlogout
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
