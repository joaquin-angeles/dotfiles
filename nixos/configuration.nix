{ config, lib, pkgs, ... }:

{
    imports =
        [
            ./packages.nix
            ./fonts.nix
            ./hardware-configuration.nix
        ];
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    networking.hostName = "nixos"; # Define your hostname.
    networking.wireless.iwd.enable = true;
    time.timeZone = "Hongkong";
    services.upower.enable = true;
    services.displayManager.ly.enable = true;
    services.xserver.videoDrivers = [ "nvidia" ];
    services.xserver.xkb.layout = "us";
    services.xserver.xkb.options = "eurosign:e,caps:escape";
    services.xserver = {
        enable = false;
    };

    services.pipewire = {
        enable = true;
        pulse.enable = true;
    };
    services.libinput.enable = true;

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
    
    hardware.graphics.enable = true;
    hardware.nvidia.modesetting.enable = true;
    hardware.nvidia.open = false;
    hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
    hardware.bluetooth.enable = true;
    hardware.graphics.enable32Bit = true;

    boot.blacklistedKernelModules = [ "nouveau" ];
    boot.kernelParams = [ "nvidia-drm.modeset=1" "modprobe.blacklist=nouveau" "nouveau.modeset=0" ];
    boot.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];

    environment.variables = {
        MUTTER_ALLOW_HYBRID_GPUS = "1";
        EGL_PLATFORM = "wayland";
        MOZ_ENABLE_WAYLAND = "1";
        MOZ_WEBRENDER = "1";
    };

    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    xdg.portal.config.common.default = "gtk";
    system.stateVersion = "25.05";
}
