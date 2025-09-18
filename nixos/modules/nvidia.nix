{ config, lib, pkgs, ... }:

{
    # Prerequisites
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.graphics = {
        enable = true; 
        enable32Bit = true;
    };
    hardware.nvidia = {
        modesetting.enable = true;
        open = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    # Kernel modules
    boot.blacklistedKernelModules = [ "nouveau" ];
    boot.initrd.kernelModules = [ "nvidia" ];
    boot.kernelModules = [ "nvidia_uvm" "nvidia_drm" ];
}
