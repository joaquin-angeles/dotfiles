#!/bin/bash

# Get the current volume level
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | head -n 1)

# Define options
options="Mute\nIncrease\nDecrease"

# Show Rofi menu and get user choice
choice=$(echo -e $options | rofi -dmenu -p "Volume: $volume")

case $choice in
    Mute)
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        ;;
    Increase)
        pactl set-sink-volume @DEFAULT_SINK@ +5%
        ;;
    Decrease)
        pactl set-sink-volume @DEFAULT_SINK@ -5%
        ;;
esac

