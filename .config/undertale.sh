#!/bin/bash

# Start Undertale
WINEPREFIX=~/.wine_lutris wine ~/Games/Undertale/Undertale.exe &

# Wait for Undertale to launch
echo "Waiting for Undertale to start..."
while ! pgrep -f Undertale.exe > /dev/null; do
    sleep 1
done

echo "Undertale detected! Running remap script..."
nohup ~/.config/undertale_remap.sh & disown

