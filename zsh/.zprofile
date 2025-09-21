if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export CLUTTER_BACKEND=wayland 
    export GDK_BACKEND=wayland
    export MOZ_ENABLE_WAYLAND=1
    export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
    export SDL_VIDEODRIVER=wayland
fi
