#!/usr/bin/env bash

# Notify the user that Wi-Fi networks are being listed
notify-send "Getting list of available Wi-Fi networks..."

# Function to get the currently connected Wi-Fi SSID
get_connected_ssid() {
    nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d':' -f2
}

# Retrieve the connected SSID
connected_ssid=$(get_connected_ssid)

# Get a list of available Wi-Fi networks and process it
wifi_list=$(nmcli --fields "SECURITY,SSID" device wifi list | sed 1d | sed 's/  */ /g' | sed -E "s/WPA*.?\S/  /g" | sed "s/^--/  /g" | sed "s/   //g" | sed "/--/d")

# Remove duplicate SSID entries while preserving order using awk
wifi_list=$(echo "$wifi_list" | awk '!seen[$0]++')

# Add the "󰄬" icon to the currently connected network
if [ -n "$connected_ssid" ]; then
    wifi_list=$(echo "$wifi_list" | sed "s/^$connected_ssid$/󰄬 $connected_ssid/")
fi

# Check if Wi-Fi is enabled or disabled
connected=$(nmcli -fields WIFI g)
if [[ "$connected" =~ "enabled" ]]; then
    toggle="󰖪   Disable Wi-Fi"
elif [[ "$connected" =~ "disabled" ]]; then
    toggle="󰖩   Enable Wi-Fi"
fi

# Use Rofi to select a Wi-Fi network
chosen_network=$(echo -e "$toggle\n$wifi_list" | rofi -dmenu -i -no-cursor -selected-row 1 -p "                                                 (Network Manager)                                                                                                                ")

# Extract the chosen network name
read -r chosen_id <<< "${chosen_network:3}"

# Handle the user's selection
if [ -z "$chosen_network" ]; then
    exit
elif [ "$chosen_network" = "󰖩   Enable Wi-Fi" ]; then
    nmcli radio wifi on
elif [ "$chosen_network" = "󰖪   Disable Wi-Fi" ]; then
    nmcli radio wifi off
else
    # Message to display upon successful connection
    success_message="You are now connected to the Wi-Fi network \"$chosen_id\"."
    
    # Retrieve saved connections
    saved_connections=$(nmcli -g NAME connection)
    
    # If the network is already saved
    if [[ $(echo "$saved_connections" | grep -w "$chosen_id") = "$chosen_id" ]]; then
        nmcli connection up id "$chosen_id" | grep "successfully" && notify-send "Connection Established" "$success_message"
    else
        # If the network is secured, ask for the password
        if [[ "$chosen_network" =~ "" ]]; then
            wifi_password=$(rofi -dmenu -p "Password: ")
        fi
        nmcli device wifi connect "$chosen_id" password "$wifi_password" | grep "successfully" && notify-send "Connection Established" "$success_message"
    fi
fi
