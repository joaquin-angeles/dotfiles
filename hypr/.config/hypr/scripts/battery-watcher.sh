#!/bin/bash

BATTERY_DEVICE=$(upower -e | grep BAT)

current_state=""

while read -r line; do
    if echo "$line" | grep -q "changed"; then
        new_state=$(upower -i "$BATTERY_DEVICE" | awk '/state:/ {print $2}')
        if [ "$new_state" != "$current_state" ]; then
            current_state="$new_state"

            if [ "$new_state" = "discharging" ]; then
                hyprctl keyword monitor ",1920x1080@60,auto,1.0"
                brightnessctl set 75%
                notify-send "Battery Mode" "Switched to 60Hz and 75% brightness"
            else
                hyprctl keyword monitor ",1920x1080@144,auto,1.0"
                brightnessctl set 100%
                notify-send "Plugged In" "Switched to 144Hz and 100% brightness"
            fi
        fi
    fi
done < <(upower --monitor)
