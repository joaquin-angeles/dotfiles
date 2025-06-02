# Theming
export GTK_THEME=Adwaita-Mono:dark
export QT_QPA_PLATFORMTHEME=qt6ct

# Env vars
if [ "$XDG_SESSION_DESKTOP" = "sway" ] || pgrep -x sway >/dev/null; then
    export XDG_CURRENT_DESKTOP=sway
    export XDG_SESSION_DESKTOP=sway
    export XDG_SESSION_TYPE=wayland
fi
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export TERM=foot
export TERMINAL=/usr/bin/foot
