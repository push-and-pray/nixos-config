{
  lib,
  config,
  ...
}: {
  options = {
    systemConfig.networking.enable = lib.mkEnableOption {
      default = true;
      description = "Enable networking";
    };
    systemConfig.networking.hostName = lib.mkOption {
      type = lib.types.str;
      default = "ares";
      description = "Hostname for the system";
    };
  };

  config = lib.mkIf config.systemConfig.networking.enable {
    networking.hostName = config.systemConfig.networking.hostName;
    networking.networkmanager.enable = true;
    services.twingate.enable = true;
    services.resolved.enable = true;
  };
}

