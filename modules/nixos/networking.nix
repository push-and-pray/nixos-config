{
  lib,
  config,
  hostname,
  ...
}: {
  options = {
    systemConfig.networking.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    systemConfig.networking.hostName = lib.mkOption {
      type = lib.types.str;
      default = hostname;
    };
  };

  config = lib.mkIf config.systemConfig.networking.enable {
    networking.hostName = config.systemConfig.networking.hostName;
    networking.networkmanager.enable = true;
    services.twingate.enable = true;
    services.resolved.enable = true;
  };
}
