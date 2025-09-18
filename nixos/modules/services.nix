{ config, lib, pkgs, ... }:

{
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
}
