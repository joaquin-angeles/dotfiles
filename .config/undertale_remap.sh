#!/bin/bash

# Check if Undertale is running
WINDOW_ID=$(xdotool search --name "UNDERTALE" | head -n 1)

if [[ -z "$WINDOW_ID" ]]; then
    echo "Undertale is not running!"
    exit 1
fi

echo "Remapping WASD to Arrow Keys for Undertale..."

# Temporarily remap keys only for XWayland
xmodmap -e "keycode 25 = Up"    # W -> Up Arrow
xmodmap -e "keycode 38 = Left"  # A -> Left Arrow
xmodmap -e "keycode 39 = Down"  # S -> Down Arrow
xmodmap -e "keycode 40 = Right" # D -> Right Arrow

echo "Remapping active! Press Ctrl+C to stop."

# Wait until user manually exits
while xdotool search --name "UNDERTALE" &>/dev/null; do
    sleep 1
done

# Restore original key mappings
setxkbmap -layout us

echo "Remapping disabled. Undertale closed."

