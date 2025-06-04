if [ "$XDG_SESSION_DESKTOP" = "sway" ] || pgrep -x sway >/dev/null; then
    export XDG_CURRENT_DESKTOP=sway
    export XDG_SESSION_DESKTOP=sway
    export XDG_SESSION_TYPE=wayland
fi

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
    export MOZ_ENABLE_WAYLAND=1
    export SDL_VIDEODRIVER=wayland
fi
