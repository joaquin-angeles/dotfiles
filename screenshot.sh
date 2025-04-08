#!/bin/bash

# Set screenshot directory
DIR=~/Pictures/Screenshots
mkdir -p "$DIR"

# Create timestamp
TIMESTAMP=$(date +%Y-%m-%d_%I-%M%p)

# Find the next available screenshot number
N=1
while [[ -e "$DIR/screenshot${N}_$TIMESTAMP.png" ]]; do
    ((N++))
done

# Final filename
FILENAME="$DIR/screenshot${N}_$TIMESTAMP.png"

# Capture and edit the screenshot
grim -g "$(slurp)" - | swappy -f - -o "$FILENAME"

