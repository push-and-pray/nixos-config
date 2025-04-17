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
      withUWSM = true;
      package = pkgs.unstable.hyprland;
      portalPackage = pkgs.unstable.xdg-desktop-portal-hyprland;
    };
    environment.systemPackages = with pkgs; [
      qt6.qtwayland
      libsForQt5.qt5.qtwayland
    ];
  };
}
