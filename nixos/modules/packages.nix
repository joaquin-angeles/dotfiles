{ config, pkgs, ... }:

let
  unstable = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
  }) {};
in
  {
  environment.systemPackages = with pkgs; [
    acpi
    auto-cpufreq
    brightnessctl
    file-roller
    unstable.hyprlock
    kdePackages.qt6ct
    kdePackages.qtstyleplugin-kvantum
    libnotify
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
    mako
    polkit_gnome
    rofi-wayland
    tlp
    tofi
    unstable.impala
    unstable.swayosd
    unstable.wayfreeze
    unstable.wiremix
    upower
    waybar
    wbg
    wl-clipboard
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    xfce.xfconf
  ];
}
