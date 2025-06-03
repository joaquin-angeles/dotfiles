if [ "$XDG_SESSION_DESKTOP" = "sway" ] || pgrep -x sway >/dev/null; then
    export XDG_CURRENT_DESKTOP=sway
    export XDG_SESSION_DESKTOP=sway
    export XDG_SESSION_TYPE=wayland
fi
