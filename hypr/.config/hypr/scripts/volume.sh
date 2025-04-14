#!/bin/bash

# Get Volume
get_volume() {
    volume=$(pamixer --get-volume)
    echo "$volume"
}

# Build Volume Bar
get_volume_bar() {
	volume=$(get_volume)
	blocks=$((volume / 5))
	bar=" "
	for ((i = 0; i < 20; i++)); do
		if [ $i -lt $blocks ]; then
			bar+="<span foreground='#5f7a8c'>▄ </span>"
		else
			bar+="<span foreground='#303030'>▄ </span>"
		fi
	done
	bar+=" "
	echo "$bar"
}

# Get Volume Icon
get_icon() {
    volume=$(get_volume)
    if [ "$volume" -eq 0 ]; then
        echo "󰝟  "  # Mute
    elif [ "$volume" -le 30 ]; then
        echo "󰕿  "  # Low
    elif [ "$volume" -le 60 ]; then
        echo "󰖀  "  # Medium
    else
        echo "󰕾  "  # High
    fi
}

# Notify
notify_user() {
    icon=$(get_icon)
    bar=$(get_volume_bar)
    volume=$(get_volume)
    notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "Volume ($volume%)" "$bar"
}

# Increase Volume
inc_volume() {
    pamixer -i 5 && notify_user
}

# Decrease Volume
dec_volume() {
    pamixer -d 5 && notify_user
}

# Toggle Mute
toggle_mute() {
    if [ "$(pamixer --get-mute)" == "false" ]; then
        pamixer -m && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "󰖁   Muted"
    elif [ "$(pamixer --get-mute)" == "true" ]; then
        pamixer -u && notify_user
    fi
}

# Execute accordingly
case "$1" in
    --get) get_volume ;;
    --inc) inc_volume ;;
    --dec) dec_volume ;;
    --toggle) toggle_mute ;;
    *) get_volume ;;
esac
