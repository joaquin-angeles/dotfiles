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
        bibata-cursors
        brightnessctl
        chafa
        cliphist
        file-roller
        glib
        glibc
        grim
        hyprcursor
        hyprlock
        hyprshot
        kdePackages.qt6ct
        kdePackages.qtstyleplugin-kvantum
        libnotify
        libsForQt5.qt5ct
        libsForQt5.qtstyleplugin-kvantum
        mako
        nwg-look
        polkit_gnome
        rofimoji
        rofi-wayland
        slurp
        snapper
        tlp
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
