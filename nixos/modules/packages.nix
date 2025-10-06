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
    tofi
    unstable.impala
    unstable.wiremix
    waybar
    wl-clipboard
    xdg-user-dirs
  ];

  # Thunar
  programs.xfconf.enable = true;
  programs.thunar.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];
}
