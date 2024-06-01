{
  lib,
  config,
  ...
}: {
  options = {
    modules.locale.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = let
    locale = "en_DK.UTF-8";
  in
    lib.mkIf config.modules.locale.enable {
      time.timeZone = "Europe/Copenhagen";

      console.keyMap = "dk-latin1";

      i18n.defaultLocale = locale;

      i18n.extraLocaleSettings = {
        LC_ADDRESS = locale;
        LC_IDENTIFICATION = locale;
        LC_MEASUREMENT = locale;
        LC_MONETARY = locale;
        LC_NAME = locale;
        LC_NUMERIC = locale;
        LC_PAPER = locale;
        LC_TELEPHONE = locale;
        LC_TIME = locale;
      };
    };
}
