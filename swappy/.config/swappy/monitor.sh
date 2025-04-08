#!/bin/bash

# Directory to monitor
WATCH_DIR="$HOME/Pictures/Screenshots"

# Monitor the directory for new PNG files
inotifywait -m -e create --format '%w%f' "$WATCH_DIR" | while read NEW_FILE
do
    # Wait for the file to be fully written
    sleep 1
    # Send a notification
    notify-send "Screenshot Saved" "Your screenshot has been saved as $(basename "$NEW_FILE")"
done

