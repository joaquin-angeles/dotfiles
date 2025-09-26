{ config, lib, pkgs, ... }:

{
  # Prerequisites
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
  boot = {
    blacklistedKernelModules = [ "nouveau" ];
    kernelModules = [ "nvidia" "nvidia_uvm" "nvidia_drm" ];
  };
}
