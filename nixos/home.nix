{ config, pkgs, ... }:

{
  # User configuration
  home.username = "joaquin";
  home.homeDirectory = "/home/joaquin";
  home.stateVersion = "25.05";

  # Thunar
  programs.xfconf.enable = true;
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };
  # Thunar thumbnail previews
  services.tumbler.enable = true;

  # GVFS
  services.gvfs.enable = true;

  # Rofi
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = [pkgs.rofi-emoji];
  };

  # User packages
  home.packages = with pkgs; [
    bat
    bibata-cursors
    celluloid
    chafa
    cliphist
    eza
    file-roller
    foot
    fzf
    grim
    hyprlock
    hyprpicker
    hyprshot
    imv
    lf
    neovim
    ripgrep
    stow
    unstable.swayosd
    tmux
    wbg
    zoxide
    zsh-powerlevel10k
  ];
}
