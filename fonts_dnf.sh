#!/bin/bash

set -e  # Exit on error

# Install Rubik font manually if not already present
if fc-list | grep -i "Rubik" &>/dev/null; then
    echo " Rubik font is already installed."
else
    echo " Installing Rubik font..."
    temp_dir=$(mktemp -d)
    git clone --depth 1 https://github.com/googlefonts/rubik.git "$temp_dir" &>/dev/null
    font_dir="$HOME/.local/share/fonts"
    mkdir -p "$font_dir"
    cp -r "$temp_dir/fonts/variable/"*.ttf "$font_dir/"
    rm -rf "$temp_dir"
    fc-cache -r
    echo " Rubik font installed successfully."
fi

# Apply Rubik font for GNOME if running GNOME
if [ "$XDG_CURRENT_DESKTOP" = "GNOME" ]; then
    echo "󰖷 Applying Rubik font to GTK..."
    gsettings set org.gnome.desktop.interface font-name 'Rubik 13' &>/dev/null
fi

# Sorted list of font packages in alphabetical order (using dnf)
font_packages=(
    google-roboto
    google-roboto-mono
    fonts-noto-cjk
    fonts-apple-emoji
    fonts-jetbrains-mono
)

# Install each font package if not already installed
for font in "${font_packages[@]}"; do
    if rpm -q "$font" &>/dev/null; then
        echo " $font is already installed."
    else
        echo " Installing $font..."
        if sudo dnf install -y "$font" &>/dev/null; then
            echo " Successfully installed $font."
        else
            echo " Failed to install $font." >&2
        fi
    fi
done

# Ensure the fonts directory exists
font_dir="$HOME/.local/share/fonts"
mkdir -p "$font_dir"

# Ensure fontconfig directory exists
fontconfig_dir="$HOME/.config/fontconfig"
mkdir -p "$fontconfig_dir"

# Remove the current fonts.conf if it exists
if [ -f "$fontconfig_dir/fonts.conf" ]; then
    echo "󰖷 Removing existing fonts.conf file..."
    rm "$fontconfig_dir/fonts.conf"
fi

# Apply the new font configuration
echo "󰖷 Configuring font settings..."
cat <<EOL > "$fontconfig_dir/fonts.conf"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE fontconfig PUBLIC "-//Freetype//DTD FONTCONFIG 2.12//EN" "http://www.freedesktop.org/standards/fontconfig/fontconfig.dtd">
<fontconfig>
  <match>
    <test name="family" qual="any">
      <string>Rubik</string>
    </test>
    <edit name="family" mode="prepend" binding="same">
      <string>Rubik</string>
    </edit>
  </match>

  <match>
    <test name="family" qual="any">
      <string>monospace</string>
    </test>
    <edit name="family" mode="prepend" binding="same">
      <string>JetBrainsMono Nerd Font Mono</string>
    </edit>
  </match>

  <match>
    <test name="family" qual="any">
      <string>emoji</string>
    </test>
    <edit name="family" mode="prepend" binding="same">
      <string>Apple Color Emoji</string>
    </edit>
  </match>

  <match>
    <test name="family" qual="any">
      <string>sans-serif</string>
    </test>
    <edit name="family" mode="prepend" binding="same">
      <string>Noto Sans CJK</string>
    </edit>
  </match>

  <match>
    <test name="family" qual="any">
      <string>serif</string>
    </test>
    <edit name="family" mode="prepend" binding="same">
      <string>Noto Serif CJK</string>
    </edit>
  </match>
</fontconfig>
EOL

fc-cache -r
echo " Font configuration applied successfully."
