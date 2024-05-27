{pkgs, ...}: {
  imports = [
    ./rofi.nix
    ./hyprland.nix
    ./waybar.nix
    ./mako.nix
  ];

  home.packages = with pkgs; [
    spotify
  ];

  programs.firefox.enable = true;
}
