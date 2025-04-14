#!/bin/bash

SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SCREENSHOT_DIR"

CLIP_HASH_BEFORE=$(wl-paste --no-newline --type image/png 2>/dev/null | sha256sum || true)

# Launch swappy with grim selection
( grim -g "$(slurp)" - | swappy -f - ) &

# Notify when screenshot is saved
inotifywait -e create --format '%f' "$SCREENSHOT_DIR" | while read NEWFILE; do
    NEWFILE_PATH="$SCREENSHOT_DIR/$NEWFILE"
    sleep 0.5
    notify-send -u low -i "$NEWFILE_PATH" "Screenshot Saved" "Saved as $NEWFILE in $SCREENSHOT_DIR"
    break
done &

# Notify when screenshot is copied to clipboard
while true; do
    sleep 0.5
    CLIP_HASH_AFTER=$(wl-paste --no-newline --type image/png 2>/dev/null | sha256sum || true)
    if [[ "$CLIP_HASH_AFTER" != "$CLIP_HASH_BEFORE" ]]; then
        TMP_IMG="$(mktemp --suffix .png)"
        wl-paste --type image/png > "$TMP_IMG"
        notify-send -u low -i "$TMP_IMG" "Screenshot Copied" "Image copied to clipboard"
        (sleep 5 && rm -f "$TMP_IMG") &
        break
    fi
done &
