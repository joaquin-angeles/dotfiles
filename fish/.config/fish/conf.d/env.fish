# Core theming
# set -x GTK_THEME=Adwaita-Mono:dark
set -x QT_QPA_PLATFORMTHEME qt6ct
set -x XCURSOR_THEME Bibata-Modern-Classic
set -x XCURSOR_SIZE 24

# Editor and terminal
set -x EDITOR /usr/bin/nvim
set -x VISUAL /usr/bin/nvim
set -x TERM foot
set -x TERMINAL /usr/bin/foot

# Language locales
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8

# Path variables
set -x PATH $HOME/.local/bin $PATH
