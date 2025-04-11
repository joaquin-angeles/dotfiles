#!/bin/bash

# Function to check if a font is installed
is_font_installed() {
    fc-list | grep -i "$1" &>/dev/null
}

# Check if Rubik font is installed
if is_font_installed "Rubik"; then
    echo "✅ Rubik font is already installed."
else
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
fi

# Apply Rubik font for GNOME (using gsettings)
echo "🔧 Applying Rubik font to GTK..."
gsettings set org.gnome.desktop.interface font-name 'Rubik 13' &>/dev/null

# Check if JetBrainsMono Nerd Font Mono is installed
if is_font_installed "JetBrainsMono Nerd Font Mono"; then
    echo "✅ JetBrainsMono Nerd Font Mono is already installed."
else
    # Install JetBrainsMono Nerd Font Mono and Apple Color Emoji fonts using paru
    echo "🔧 Installing JetBrainsMono Nerd Font Mono and Apple Color Emoji fonts..."
    paru -S --noconfirm ttf-jetbrains-mono-nerd ttf-apple-color-emoji

    # Update font cache again after installation
    fc-cache -fv &>/dev/null
    echo "✅ JetBrainsMono Nerd Font Mono and Apple Color Emoji fonts installed successfully."
fi

# Ensure the fontconfig directory exists
fontconfig_dir="$HOME/.config/fontconfig"
mkdir -p "$fontconfig_dir"
echo "📁 Ensured that the $fontconfig_dir directory exists."

# Remove the existing fonts.conf file if it exists
fonts_conf_file="$fontconfig_dir/fonts.conf"
if [ -f "$fonts_conf_file" ]; then
    echo "⚠️ Removing existing fonts.conf file..."
    rm "$fonts_conf_file"
fi

# Apply fonts by modifying fontconfig's fonts.conf
echo "🔧 Applying fonts to fontconfig..."

# Create the new fonts.conf with the desired fonts
cat <<EOL > "$fonts_conf_file"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE fontconfig PUBLIC "-//Freetype//DTD FONTCONFIG 2.12//EN" "http://www.freedesktop.org/standards/fontconfig/fontconfig.dtd">
<fontconfig>
  <match target="pattern">
    <test name="family" qual="any">
      <string>Rubik</string>
    </test>
    <edit name="family" mode="prepend" binding="same">
      <string>Rubik</string>
    </edit>
  </match>
  
  <match target="pattern">
    <test name="family" qual="any">
      <string>monospace</string>
    </test>
    <edit name="family" mode="prepend" binding="same">
      <string>JetBrainsMono Nerd Font Mono</string>
    </edit>
  </match>

  <match target="pattern">
    <test name="family" qual="any">
      <string>emoji</string>
    </test>
    <edit name="family" mode="prepend" binding="same">
      <string>Apple Color Emoji</string>
    </edit>
  </match>

</fontconfig>
EOL

echo "✅ Fonts applied successfully to fontconfig."
