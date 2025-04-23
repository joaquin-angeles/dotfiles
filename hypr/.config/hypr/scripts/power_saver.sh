#!/bin/bash

BATTERY_DEVICE=$(upower -e | grep BAT)
KBD_DEVICE="asus::kbd_backlight"
current_state=""

while read -r line; do
    if echo "$line" | grep -q "changed"; then
        new_state=$(upower -i "$BATTERY_DEVICE" | awk '/state:/ {print $2}')
        if [ "$new_state" != "$current_state" ]; then
            current_state="$new_state"

            if [ "$new_state" = "discharging" ]; then
                hyprctl keyword monitor ",1920x1080@60,auto,1.0"
                brightnessctl set 40%
                brightnessctl --device="$KBD_DEVICE" set 0
                notify-send "Battery Mode" "Switched to 60Hz, 50% brightness, keyboard backlight OFF"
            else
                hyprctl keyword monitor ",1920x1080@144,auto,1.0"
                brightnessctl set 80%
                brightnessctl --device="$KBD_DEVICE" set 100%
                notify-send "Plugged In" "Switched to 144Hz, 100% brightness, keyboard backlight ON"
            fi
        fi
    fi
done < <(upower --monitor)
