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
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelModules = [ "zram" ];

    # Networking options
    networking.hostName = "nixos"; # Define your hostname.
    networking.wireless.iwd.enable = true;
    # Fail2Ban
    services.fail2ban = {
        enable = true;
        maxretry = 3;
        ignoreIP = [
            "10.0.0.0/8" "172.16.0.0/12" "192.168.0.0/16"
            "8.8.8.8"
        ];
        bantime = "30m";
        bantime-increment = {
            enable = true;
            multipliers = "1 2 4 8 16 32 64";
            maxtime = "24h";
            overalljails = true;
        };
    };
    # Firewall
    networking.nftables.enable = true;
    networking.nftables.ruleset = ''
    table inet filter {
      chain input {
        iifname lo accept
        ct state {established, related} accept
        ip protocol icmp accept
        ip6 nexthdr icmpv6 accept
      }
      chain output {
        type filter hook output priority 0; policy accept;
      }
      chain forward {
        type filter hook forward priority 0; policy drop;
      }
    }
    '';
    networking.nftables.checkRuleset = true;

    # Zram
    zramSwap = {
        enable = true;
        algorithm = "zstd";
        memoryPercent = 50;
        swapDevices = 1;
        priority = 50;
    };

    # User configurations
    time.timeZone = "Hongkong";
    users.defaultUserShell = pkgs.zsh;
    environment.shells = with pkgs; [ zsh ];
    programs.zsh = {
        enable = true;
        autosuggestions.enable = true;
        syntaxHighlighting.enable = true;
    };
    programs.hyprland.enable = true;
    services.flatpak.enable = true;
    users.users.joaquin = {
        isNormalUser = true;
        extraGroups = [ "wheel" "sandbox"];
    };

    # Nix package manager
    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Container portals
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    xdg.portal.config.common.default = "gtk";
    system.stateVersion = "25.05";
}
