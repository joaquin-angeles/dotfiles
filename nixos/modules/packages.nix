{ config, lib, pkgs, ... }:

let
  unstable = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
  }) {};
in
  {
  environment.systemPackages = with pkgs; [
    brightnessctl
    libnotify
    mako
    pavucontrol
    rofi-wayland
    unstable.nmgui
    wl-clipboard
    xdg-user-dirs
  ];
}
