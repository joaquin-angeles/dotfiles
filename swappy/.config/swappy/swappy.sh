#!/bin/bash

SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SCREENSHOT_DIR"

CLIP_HASH_BEFORE=$(wl-paste --no-newline --type image/png 2>/dev/null | sha256sum)

grim -g "$(slurp)" - | swappy -f - &

inotifywait -e create --format '%f' "$SCREENSHOT_DIR" | while read NEWFILE; do
    NEWFILE_PATH="$SCREENSHOT_DIR/$NEWFILE"
    sleep 0.2
    notify-send -i "$NEWFILE_PATH" "Screenshot Saved" "Saved as $NEWFILE in $SCREENSHOT_DIR"
    break
done &

while true; do
    sleep 0.5
    CLIP_HASH_AFTER=$(wl-paste --no-newline --type image/png 2>/dev/null | sha256sum)
    if [[ "$CLIP_HASH_AFTER" != "$CLIP_HASH_BEFORE" ]]; then
        TMP_IMG="/tmp/preview.png"
        wl-paste --type image/png > "$TMP_IMG"
        notify-send -i "$TMP_IMG" "Screenshot Copied" "Image copied to clipboard"
        (sleep 5 && rm -f "$TMP_IMG") &
        break
    fi
done &
