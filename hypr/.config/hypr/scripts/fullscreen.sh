#!/bin/bash

was_fullscreen=false

while true; do
    is_fullscreen=$(hyprctl activewindow -j | jq '.fullscreen')

    if $is_fullscreen && [ "$was_fullscreen" = false ]; then
        pkill waybar
        was_fullscreen=true
    elif ! $is_fullscreen && [ "$was_fullscreen" = true ]; then
        waybar &
        was_fullscreen=false
    fi

    sleep 0.5
done
