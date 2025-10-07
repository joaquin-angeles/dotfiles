{ config, pkgs, ... }:

{
  # User configuration
  home.username = "joaquin";
  home.homeDirectory = "/home/joaquin";
  home.stateVersion = "25.05";

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
    gvfs
    hyprlock
    hyprpicker
    hyprshot
    imv
    lf
    nemo-with-extensions
    neovim
    ripgrep
    stow
    unstable.swayosd
    tmux
    wbg
    zoxide
    zsh-powerlevel10k
  ];

  # Variables
  home.sessionVariables = {
    GIO_EXTRA_MODULES = "${pkgs.gvfs}/lib/gio/modules";
  };
}
