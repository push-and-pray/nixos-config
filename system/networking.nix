{
  lib,
  config,
  hostname,
  ...
}: {
  networking = {
    hostName = hostname;
    networkmanager.enable = true;
    dhcpcd.enable = false;
  };

  services = {
    blueman.enable = config.hardware.bluetooth.enable;
    resolved.enable = true;
    twingate.enable = true;
  };

  hardware.bluetooth.enable = lib.mkDefault true;
}
