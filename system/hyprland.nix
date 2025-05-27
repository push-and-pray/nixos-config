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
    };
    environment.systemPackages = with pkgs; [
      qt6.qtwayland
      libsForQt5.qt5.qtwayland
    ];
    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";

      GDK_BACKEND = "wayland,x11,*";
      CLUTTER_BACKEND = "wayland";
      SDL_VIDEODRIVER = "wayland";

      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";

      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      QT_QPA_PLATFORMTHEME = "qt5ct";
    };
  };
}
