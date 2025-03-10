#!/bin/bash

# Define the dotfiles directory (change this if your dotfiles are elsewhere)
DOTFILES_DIR="$HOME/dotfiles"

# Remove existing config files (Be careful with this!)
echo "Removing existing config files..."
rm -rf ~/.config/*

# Create symlinks for everything inside .config
echo "Creating symlinks for .config files..."
ln -sf $DOTFILES_DIR/.config/* ~/.config/

# Removing existing icon themes
echo "Removing existing icon themes.."
rm -rf ~/.local/share/icons/*

# Adding icon themes
echo "Adding icon themes"
ln -sf $DOTFILES_DIR/.local/share/icons/* ~/.local/share/icons/

# Optional: Symlink other dotfiles
echo "Creating symlinks for other dotfiles..."
ln -sf $DOTFILES_DIR/.icons/* ~/.icons
mkdir -p .zsh
ln -sf $DOTFILES_DIR/.zsh/* ~/.zsh
ln -sf $DOTFILES_DIR/.zshrc ~/.zshrc

# Done
echo "Joaquin's dotfiles installed successfully!"
