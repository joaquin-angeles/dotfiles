{ config, lib, pkgs, ... }:

{
  # Packages
  environment.systemPackages = with pkgs; [
    acpi
    auto-cpufreq
    tlp
    upower
  ];

  # Power-savers
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
}
