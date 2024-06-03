{
  pkgs,
  config,
  lib,
  osConfig,
  ...
}: {
  home.packages = with pkgs; [
    rofi-wayland
  ];
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };
}
