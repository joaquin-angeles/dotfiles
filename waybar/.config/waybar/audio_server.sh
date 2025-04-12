#!/bin/bash

# Check if PipeWire is running
if pgrep -x "pipewire" > /dev/null; then
    echo "PipeWire"
# Check if PulseAudio is running
elif pgrep -x "pulseaudio" > /dev/null; then
    echo "PulseAudio"
else
    echo "No Audio Server"
fi

