{
  lib,
  config,
  ...
}: {
  options = {
    modules.OPTION = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config =
    lib.mkIf config.modules.OPTION {
    };
}
