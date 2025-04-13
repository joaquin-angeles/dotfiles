#!/bin/bash

# Get the current volume level as a percentage
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk -F' ' '{print $5}' | tr -d '%')

# Set the total number of characters for the progress bar
max_blocks=20

# Calculate the number of filled blocks based on the volume (every 5% corresponds to one filled block)
num_blocks=$((volume / 5))

# Ensure the number of blocks does not exceed max_blocks (in case volume > 100%)
num_blocks=$((num_blocks > max_blocks ? max_blocks : num_blocks))

# Build the progress bar string with exactly 20 characters
bar="["$(for ((i=0; i<num_blocks; i++)); do echo -n "#"; done)$(for ((i=num_blocks; i<max_blocks; i++)); do echo -n "."; done)"]"

# Send the notification to the system using notify-send
notify-send "Volume" "$bar"
