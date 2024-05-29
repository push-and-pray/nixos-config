{pkgs, ...}: {
  imports = [
    ./rofi.nix
    ./hyprland.nix
    ./waybar.nix
    ./mako.nix
  ];

  home.packages = with pkgs; [
    spotify
    signal-desktop
  ];

  programs.firefox.enable = true;
}
