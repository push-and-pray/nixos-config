{pkgs, ...}: {
  imports = [
    ./hyprland.nix
    ./waybar.nix
    ./mako.nix
    ./rofi.nix
    ./ags
  ];

  home.packages = with pkgs; [
    spotify
    signal-desktop
  ];

  programs.firefox.enable = true;
}
