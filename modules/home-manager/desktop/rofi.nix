{
  pkgs,
  config,
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf osConfig.modules.hyprland.enable {
    home.packages = with pkgs; [
      rofi-wayland
    ];
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
    };
  };
}
