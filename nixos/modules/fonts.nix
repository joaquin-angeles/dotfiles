{ config, pkgs, ... }:

{
    fonts = {
        enableDefaultPackages = true;
        packages = with pkgs; [
            inter
            noto-fonts-cjk-sans
            noto-fonts-emoji-blob-bin
            nerd-fonts.meslo-lg
        ];
    };
}
