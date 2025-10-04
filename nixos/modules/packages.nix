{ config, lib, pkgs, ... }:

{
  # System packages
  environment.systemPackages = with pkgs; [
    brightnessctl
    libnotify
    mako
    pavucontrol
    rofi-wayland
    unstable.nmgui
    vulkan-tools
    wl-clipboard
    xdg-user-dirs
  ];

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
      kdePackages.qt6ct
      kdePackages.qtstyleplugin-kvantum
      lf
      libsForQt5.qt5ct
      libsForQt5.qtstyleplugin-kvantum
      neovim
      nwg-look
      ripgrep
      rofimoji
      stow
      unstable.swayosd
      tmux
      tofi
      waybar
      wbg
      xfce.thunar
      xfce.thunar-archive-plugin
      xfce.thunar-volman
      xfce.xfconf
      zoxide
      zsh-powerlevel10k
    ];
  };
}
