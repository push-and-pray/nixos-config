{pkgs, ...}: {
  imports = [
    ./hyprland.nix
    ./waybar.nix
    ./mako.nix
    ./rofi.nix
  ];

  home.packages = with pkgs; [
    spotify
    signal-desktop
    unstable.obsidian
    keepassxc
  ];

  programs.firefox.enable = true;
}
