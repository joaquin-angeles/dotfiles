{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    autoconf
    automake
    bison
    curl
    flex
    gcc
    git
    gnumake
    lf
    libtool
    pkgconf
    python3Full
    wget
  ];
}
