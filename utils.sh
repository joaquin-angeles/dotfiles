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

# Install rog-control-center and supergfxctl
echo "🔧 Installing rog-control-center and supergfxctl..."

# Install rog-control-center
if paru -S --noconfirm rog-control-center &>/dev/null; then
    echo "✅ rog-control-center installed successfully."
else
    echo "❌ Failed to install rog-control-center." >&2
fi

# Install supergfxctl
if paru -S --noconfirm supergfxctl &>/dev/null; then
    echo "✅ supergfxctl installed successfully."
else
    echo "❌ Failed to install supergfxctl." >&2
fi

echo "✅ Installation complete."

