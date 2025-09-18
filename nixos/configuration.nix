{ config, lib, pkgs, ... }:

{
    imports = [
        ./development-tools.nix
        ./packages.nix
        ./fonts.nix
        ./nvidia.nix
        /etc/nixos/hardware-configuration.nix
    ];

    # Boot options
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelModules = [ "zram" ];

    # Networking options
    networking.hostName = "nixos"; # Define your hostname.
    networking.wireless.iwd.enable = true;

    # Zram
    zramSwap = {
        enable = true;
        algorithm = "zstd";
        memoryPercent = 50;
        swapDevices = 1;
        priority = 50;
    };

    # Power-saving agents
    services.power-profiles-daemon.enable = false;
    services.tlp.enable = true;
    services.tlp.settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "";
        CPU_SCALING_GOVERNOR_ON_BAT = "";
        CPU_SCALING_DRIVER = "";
    };
    services.auto-cpufreq.enable = true;
    services.auto-cpufreq.settings = {
        battery = {
            governor = "powersave";
            turbo = "never";
        };
        charger = {
            governor = "performance";
            turbo = "auto";
        };
    };
    services.upower.enable = true;

    # Display Manager
    services.displayManager.ly.enable = true;
    services.xserver.xkb.layout = "us";
    services.xserver.xkb.options = "eurosign:e,caps:escape";
    services.xserver = {
        enable = true;
        windowManager.i3.enable = true;
    };

    # Connectivity configurations
    hardware.bluetooth.enable = true;
    services.pipewire = {
        enable = true;
        pulse.enable = true;
    };
    services.libinput.enable = true;

    # User configurations
    time.timeZone = "Hongkong";
    users.defaultUserShell = pkgs.zsh;
    environment.shells = with pkgs; [ zsh ];
    environment.variables = {
        ROFI_PLUGIN_PATH = "${pkgs.rofi-emoji}/lib/rofi";
    };
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
