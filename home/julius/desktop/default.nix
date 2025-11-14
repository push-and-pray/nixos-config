{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hyprland.nix
    ./waybar.nix
    ./mako.nix
  ];

  services.gammastep = {
    enable = true;
    provider = "manual";
    latitude = 55.68;
    longitude = 12.57;
  };

  home.packages = with pkgs; [
    spotify
    unstable.signal-desktop
    unstable.obsidian
    keepassxc
    hyprshot
    drawio
    inkscape
  ];
  programs.firefox = {
    enable = true;
    profiles.default.extensions.force = true;
  };

  stylix.targets.firefox = {
    enable = true;
    colorTheme.enable = true;
    profileNames = ["default"];
  };

  programs.vscode = {
    enable = true;
  };
}
