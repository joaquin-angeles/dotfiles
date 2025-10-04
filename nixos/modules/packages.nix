{ config, lib, pkgs, ... }:

{
  # System packages
  environment.systemPackages = with pkgs; [
    brightnessctl
    libnotify
    kdePackages.qt6ct
    kdePackages.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
    mako
    nwg-look
    pavucontrol
    rofi-wayland
    tofi
    unstable.nmgui
    waybar
    wl-clipboard
    xdg-user-dirs
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    xfce.xfconf
  ];

  # User packages
  users.users.joaquin = {
    packages = with pkgs; [
      bat
      bibata-cursors
      celluloid
      chafa
      cliphist
      eza
      file-roller
      foot
      fzf
      grim
      hyprlock
      hyprpicker
      hyprshot
      imv
      lf
      neovim
      ripgrep
      rofimoji
      stow
      unstable.swayosd
      tmux
      wbg
      zoxide
      zsh-powerlevel10k
    ];
  };
}
