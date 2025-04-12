#!/bin/bash

# Battery thresholds
LOW=20
FULL=95

# Get battery percentage and charging state
INFO=$(acpi -b)
PERCENT=$(echo "$INFO" | grep -P -o '[0-9]+(?=%)')
STATUS=$(echo "$INFO" | grep -oP 'Charging|Discharging|Full')

# Low battery notification
if [[ "$PERCENT" -le "$LOW" && "$STATUS" == "Discharging" ]]; then
  notify-send -u critical "🔋 Low Battery" "Battery is at ${PERCENT}%!"
fi

# Full battery notification
if [[ "$PERCENT" -ge "$FULL" && "$STATUS" == "Charging" ]]; then
  notify-send -u normal "⚡ Battery Full" "You can unplug the charger now."
fi

