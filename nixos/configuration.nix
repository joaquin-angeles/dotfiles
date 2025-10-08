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
  boot.kernelModules = [ "zram" ];
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };

  # Container portals
  xdg.portal = {
    config = {
      common.default = [ "hyprland" "gtk" ];
    };
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
    xdgOpenUsePortal = true;
  };

  # Environment
  environment.shells = with pkgs; [ zsh ];

  # Hyprland
  programs.hyprland.enable = true;

  # Networking options
  networking = {
    hostName = "home";
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };

    # Firewall
    nftables.checkRuleset = true;
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
  };

  # Nix package manager
  nix.optimise.automatic = true;
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
  };
  nixpkgs.config.allowUnfree = true;

  # System version
  system.stateVersion = "25.05";

  # Timezone
  services.timesyncd.enable = true;
  time.timeZone = "Asia/Manila";

  # User configuration
  users.users.joaquin = {
    extraGroups = [ "wheel" ];
    isNormalUser = true;
    shell = pkgs.zsh;
  };

  # Zram
  zramSwap = {
    algorithm = "zstd";
    enable = true;
    memoryPercent = 50;
    priority = 50;
    swapDevices = 1;
  };

  # Zsh
  programs.zsh = {
    autosuggestions.enable = true;
    enable = true;
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    syntaxHighlighting.enable = true;
  };
}
