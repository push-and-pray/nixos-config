{
  lib,
  config,
  hostname,
  ...
}: {
  networking.hostName = hostname;
  networking.networkmanager.enable = true;
  services.resolved.enable = true;

  networking.dhcpcd.enable = false;

  hardware.bluetooth.enable = lib.mkDefault true;
  services.blueman.enable = config.hardware.bluetooth.enable;

  services.twingate.enable = true;

  networking.firewall.enable = false;
}
