{pkgs, ...}: {
  imports = [
    ./hyprland.nix
    ./waybar.nix
    ./mako.nix
  ];

  home.packages = with pkgs; [
    spotify
    signal-desktop-bin
    unstable.obsidian
    keepassxc
    hyprshot
    drawio
    inkscape
  ];

  programs.firefox.enable = true;
  programs.vscode.enable = true;
}
