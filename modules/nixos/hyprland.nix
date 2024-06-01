{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    modules.hyprland.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf config.modules.hyprland.enable {
    security.pam.services.hyprlock = {};
    programs.hyprland = {
      enable = true;
    };
    environment.systemPackages = with pkgs; [
      qt6.qtwayland
      libsForQt5.qt5.qtwayland
    ];
  };
}
