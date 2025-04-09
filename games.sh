#!/bin/bash

# Installing Steam, Lutris, MCPelauncher, and MCPelauncher UI
echo "Installing Steam, Lutris, MCPelauncher, and MCPelauncher UI with paru..."
paru -S --noconfirm steam lutris mcpelauncher-linux mcpelauncher-ui

# Check if paru command was successful
if [ $? -eq 0 ]; then
  echo "Steam, Lutris, MCPelauncher, and MCPelauncher UI installed successfully."
else
  echo "Error: Installation of Steam, Lutris, MCPelauncher, or MCPelauncher UI failed."
  exit 1
fi

# Installing Vinegar (Sober) from Flatpak
echo "Installing Vinegar (Sober) via Flatpak..."
flatpak install -y org.vinegarhq.Sober

# Check if flatpak command was successful
if [ $? -eq 0 ]; then
  echo "Vinegar (Sober) installed successfully."
else
  echo "Error: Installation of Vinegar (Sober) failed."
  exit 1
fi

echo "All installations completed successfully."
