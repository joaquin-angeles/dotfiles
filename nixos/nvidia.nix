{ config, lib, pkgs, ... }:

{
    hardware.graphics.enable = true;
    hardware.nvidia.modesetting.enable = true;
    hardware.nvidia.open = false;
    hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
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
}
