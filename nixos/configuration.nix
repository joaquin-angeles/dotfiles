{ config, lib, pkgs, ... }:

{
    imports =
        [
            ./packages.nix
            ./fonts.nix
            ./nvidia.nix
            ./hardware-configuration.nix
        ];
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    networking.hostName = "nixos"; # Define your hostname.
    networking.wireless.iwd.enable = true;

    services.tlp.enable = true;
    services.tlp.settings = {
        CPU_SCALING_GOVERNOR = "performance";
        CPU_SCALING_DRIVER = "none";
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
    services.displayManager.ly.enable = true;
    services.xserver.videoDrivers = [ "nvidia" ];
    services.xserver.xkb.layout = "us";
    services.xserver.xkb.options = "eurosign:e,caps:escape";
    services.xserver = {
        enable = false;
    };

    hardware.bluetooth.enable = true;
    services.pipewire = {
        enable = true;
        pulse.enable = true;
    };
    services.libinput.enable = true;
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
    
    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    xdg.portal.config.common.default = "gtk";
    system.stateVersion = "25.05";
}
