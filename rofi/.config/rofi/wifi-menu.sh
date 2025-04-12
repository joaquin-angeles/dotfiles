#!/bin/bash

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
selection=$(printf '%s\n' "${menu_items[@]}" | rofi -dmenu -p "Network Manager:" -theme-str 'listview {spacing: 6px;}')

# Handle selection
case "$selection" in
    "$SCAN_ICON")
        # Scan and refresh
        nmcli device wifi rescan > /dev/null 2>&1
        notify-send "Wi-Fi Scan" "Scanning for available networks..." -i network-wireless
        exec "$0"
        ;;
    "$WIFI_ON_ICON")
        # Disable Wi-Fi
        nmcli radio wifi off
        notify-send "Wi-Fi Disabled" "Wi-Fi has been disabled." -i network-wireless-disconnected
        exec "$0"
        ;;
    "$WIFI_OFF_ICON")
        # Enable Wi-Fi
        nmcli radio wifi on
        notify-send "Wi-Fi Enabled" "Wi-Fi is now enabled." -i network-wireless
        exec "$0"
        ;;
    "")
        exit
        ;;
    *)
        ssid_selected=$(echo "$selection" | sed 's/^.* //')

        # Prompt for password for all networks
        password=$(rofi -dmenu -p "Enter Password for $ssid_selected:" -password)
        if [[ -z "$password" ]]; then
            notify-send "Connection Failed" "No password entered for $ssid_selected." -i network-wireless-off
            exit
        fi

        # Attempt to find the correct security type for the network
        security_type=$(nmcli device wifi list | grep "$ssid_selected" | awk '{print $NF}')

        # Default to WPA2 if the security type is not clear
        case "$security_type" in
            WPA3)
                nmcli device wifi connect "$ssid_selected" password "$password" 802-11-wireless-security.key-mgmt=wpa3-psk
                ;;
            WPA2)
                nmcli device wifi connect "$ssid_selected" password "$password" 802-11-wireless-security.key-mgmt=wpa-psk
                ;;
            *)
                # For open networks (no password)
                nmcli device wifi connect "$ssid_selected"
                ;;
        esac

        # Notification for successful connection attempt
        notify-send "Connecting to $ssid_selected" "Attempting to connect..." -i network-wireless
        ;;
esac
