{ config, pkgs, ... }:

{
  home.username = "joaquin";
  home.homeDirectory = "/home/joaquin";
  programs.git.enable = true;
  home.stateVersion = "25.05";
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    initContent = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  };

  home.packages = with pkgs; [
    neovim
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    gcc
    rofi
    xwallpaper
  ];
}
