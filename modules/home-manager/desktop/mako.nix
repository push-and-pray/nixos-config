{
  pkgs,
  config,
  osConfig,
  lib,
  ...
}: {
  config = lib.mkIf osConfig.modules.hyprland.enable {
    services.mako = {
      enable = true;
      defaultTimeout = 10000;
    };

    home.packages = with pkgs; [
      libnotify
    ];
  };
}
