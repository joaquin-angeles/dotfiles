{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
        inter
        nerd-fonts.meslo-lg
        noto-fonts-emoji-blob-bin
        noto-fonts-cjk-sans
  ];
}
