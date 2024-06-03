{
  pkgs,
  lib,
  ...
}: {
  options = {
    programs.hyprland.monitors = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [",preferred,auto,1"];
    };
  };

  config = {
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
