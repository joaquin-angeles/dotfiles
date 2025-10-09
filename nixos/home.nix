{ config, pkgs, ... }:

{
  # User configuration
  home.username = "joaquin";
  home.homeDirectory = "/home/joaquin";
  home.stateVersion = "25.05";

  # Configurations
  home.file.".config/foot".source = ../foot;
  home.file.".config/hypr".source = ../hyprland;
  home.file.".config/lf".source = ../lf;
  home.file.".config/mako".source = ../mako;
  home.file.".config/nvim".source = ../neovim;
  home.file.".config/rofi".source = ../rofi;
  home.file.".config/swayosd".source = ../swayosd;
  home.file.".config/tmux".source = ../tmux;
  home.file.".config/waybar".source = ../waybar;
  
  # Rofi
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = [pkgs.rofi-emoji];
  };

  # Packages
  home.packages = with pkgs; [
    bat
    bibata-cursors
    btop
    celluloid
    chafa
    cliphist
    eza
    fastfetchMinimal
    foot
    fzf
    grim
    hyprlock
    hyprpicker
    hyprshot
    imv
    lazygit
    lf
    mako
    neovim
    ripgrep
    unstable.impala
    unstable.swayosd
    unstable.wiremix
    tmux
    waybar
    wbg
    wl-clipboard
    zoxide
    zsh-powerlevel10k
  ];

  # Variables
  home.sessionVariables = {
    GIO_EXTRA_MODULES = "${pkgs.gvfs}/lib/gio/modules";
  };
}
