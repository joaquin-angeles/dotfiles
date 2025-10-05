{ config, lib, pkgs, ... }:

{
  # System packages
  environment.systemPackages = with pkgs; [
    brightnessctl
    libnotify
    kdePackages.qt6ct
    kdePackages.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
    mako
    nwg-look
    rofi-wayland
    tofi
    unstable.impala
    unstable.wiremix
    waybar
    wl-clipboard
    xdg-user-dirs
  ];

  # Thunar plugins
  programs.xfconf.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];
  services.tumbler.enable = true;

  # User packages
  users.users.joaquin = {
    packages = with pkgs; [
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
      rofimoji
      stow
      unstable.swayosd
      tmux
      wbg
      xfce.thunar
      zoxide
      zsh-powerlevel10k
    ];
  };
}
