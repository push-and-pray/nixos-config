{
  lib,
  config,
  hostname,
  ...
}: {
  options = {
    modules.networking.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    modules.networking.hostName = lib.mkOption {
      type = lib.types.str;
      default = hostname;
    };
  };

  config = lib.mkIf config.modules.networking.enable {

    networking.hostName = config.modules.networking.hostName;
    networking.networkmanager.enable = true;
    services.twingate.enable = true;
    services.resolved.enable = true;

    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;
    services.blueman.enable = true;
  };
}
