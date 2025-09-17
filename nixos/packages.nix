{ config, pkgs, ... }:

let
    unstable = import (builtins.fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
    }) {};
in


{
    environment.systemPackages = with pkgs; [
        auto-cpufreq
        bibata-cursors
        brightnessctl
        chafa
        cliphist
        hyprcursor
        hyprlock
        hyprshot
        impala
        kdePackages.qt6ct
        kdePackages.qtstyleplugin-kvantum
        libnotify
        libsForQt5.qt5ct
        libsForQt5.qtstyleplugin-kvantum
        mako
        nwg-look
        polkit_gnome
        rofi-wayland
        rofimoji
        snapper
        unstable.swayosd
        nautilus
        tlp
        upower
        wbg
        waybar
        wl-clipboard-rs
    ];
}
