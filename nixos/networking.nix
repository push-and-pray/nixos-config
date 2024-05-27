{...}:
{

  networking.hostName = "ares";
  networking.networkmanager.enable = true;
  services.twingate.enable = true;
  services.resolved.enable = true;
}
