#!/bin/bash

notify-send "Wi-Fi scan..." "Getting network list..." &

# Icons
SCAN_ICON="󰐷   Scan"
WIFI_ON_ICON="󰖪   Disable Wi-Fi"
WIFI_OFF_ICON="󰖩   Enable Wi-Fi"
CHECKMARK_ICON="󰄬 "

# Check Wi-Fi status
wifi_status=$(nmcli radio wifi)
TOGGLE_WIFI=$([[ "$wifi_status" == "enabled" ]] && echo "$WIFI_ON_ICON" || echo "$WIFI_OFF_ICON")

# Rescan networks
nmcli device wifi rescan > /dev/null 2>&1
sleep 1

# Build SSID list with signal icons, no duplicates, and check for currently connected
declare -A seen_ssids
ssid_menu=()

# Get connected SSID
connected_ssid=$(nmcli -t -f ACTIVE,SSID device wifi | grep '^yes' | cut -d':' -f2)

while IFS= read -r line; do
    ssid=$(echo "$line" | awk '{$NF=""; print $0}' | sed 's/ *$//')
    signal=$(echo "$line" | awk '{print $NF}')

    # Skip hidden or empty SSIDs
    if [[ -z "$ssid" || "$ssid" == "--" ]]; then
        continue
    fi

    # Skip duplicates
    if [[ -n "${seen_ssids[$ssid]}" ]]; then
        continue
    fi
    seen_ssids["$ssid"]=1

    # Choose signal icon
    if (( signal == 100 )); then
        icon="󰤨   "
    elif (( signal >= 76 )); then
        icon="󰤥   "
    elif (( signal >= 51 )); then
        icon="󰤢   "
    elif (( signal >= 26 )); then
        icon="󰤟   "
    else
        icon="󰤯   "
    fi

    # Check for connected SSID and add checkmark
    if [[ "$ssid" == "$connected_ssid" ]]; then
        ssid_menu+=("$CHECKMARK_ICON $icon $ssid")
    else
        ssid_menu+=("$icon $ssid")
    fi
done < <(nmcli -f SSID,SIGNAL device wifi list | awk 'NR>1')

# Final menu
menu_items=("$SCAN_ICON" "$TOGGLE_WIFI" "" "${ssid_menu[@]}")

# Show Rofi menu
makoctl dismiss
selection=$(printf '%s\n' "${menu_items[@]}" | rofi -dmenu -p "Network Manager:" -theme-str 'listview {spacing: 6px;}')

# Handle selection
case "$selection" in
    "$SCAN_ICON")
        nmcli device wifi rescan > /dev/null 2>&1
        notify-send "Wi-Fi Scan" "Scanning for available networks..." -i network-wireless
        exec "$0"
        ;;
    "$WIFI_ON_ICON")
        nmcli radio wifi off
        notify-send "Wi-Fi Disabled" "Wi-Fi has been disabled." -i network-wireless-disconnected
        exec "$0"
        ;;
    "$WIFI_OFF_ICON")
        nmcli radio wifi on
        notify-send "Wi-Fi Enabled" "Wi-Fi is now enabled." -i network-wireless
        exec "$0"
        ;;
    "")
        exit
        ;;
    *)
        ssid_selected=$(echo "$selection" | sed 's/^.* //')

        # Delete the existing connection profile for the SSID
        nmcli connection delete id "$ssid_selected" > /dev/null 2>&1

        # Prompt for the password
        password=$(rofi -dmenu -p "Enter Password for $ssid_selected:" -password)
        if [[ -z "$password" ]]; then
            notify-send "Connection Failed" "Password is required to connect to $ssid_selected."
            exit
        fi

        # Try connecting with the provided password
        nmcli device wifi connect "$ssid_selected" password "$password" || {
            notify-send "Connection Failed" "Failed to connect to $ssid_selected."
            exit
        }
        ;;
esac
