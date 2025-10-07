{ config, lib, pkgs, ... }:

{
  # Modules
  imports = [
    ./modules/development-tools.nix
    ./modules/fonts.nix
    ./modules/laptop.nix
    ./modules/nvidia.nix
    ./modules/packages.nix
    ./modules/services.nix
    /etc/nixos/hardware-configuration.nix
  ];

  # Boot options
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  boot.kernelModules = [ "zram" ];

  # Networking options
  networking = {
    hostName = "home"; # Define your hostname.
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
    wireless = {
      # enable = true;
      iwd.enable = true;
    };

    # Firewall
    nftables.enable = true;
    nftables.ruleset = ''
    table inet filter {

      chain input {
        type filter hook input priority 0; policy drop;
        iifname lo accept
        ct state {established, related} accept
        ip saddr {10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16} tcp dport 22 accept
        ip protocol icmp limit rate 5/second accept
        ip6 nexthdr icmpv6 limit rate 5/second accept
      }
      chain output {
        type filter hook output priority 0; policy accept;
      }
      chain forward {
        type filter hook forward priority 0; policy drop;
      }
    }
    '';
    nftables.checkRuleset = true;
  };

  # Fail2Ban
  services.fail2ban = {
    enable = true;
    maxretry = 3;
    ignoreIP = [
      "10.0.0.0/8" "172.16.0.0/12" "192.168.0.0/16"
    ];
    bantime = "30m";
    bantime-increment = {
      enable = true;
      multipliers = "1 2 4 8 16 32 64";
      maxtime = "24h";
      overalljails = true;
    };
  };

  # Zram
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
    swapDevices = 1;
    priority = 50;
  };

  # Timezone
  time.timeZone = "Asia/Manila";
  services.timesyncd.enable = true;

  # Zsh
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  };
  environment.shells = with pkgs; [ zsh ];

  # Hyprland
  programs.hyprland.enable = true;

  # User configuration
  users.users.joaquin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };

  # Nix package manager
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Container portals
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      common.default = [ "gtk" ];
      hyprland.default = [ "gtk" "hyprland" ];
    };
  };
  system.stateVersion = "25.05";
}
