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
    nwg-look
    wl-clipboard
    xdg-user-dirs
  ];
}
