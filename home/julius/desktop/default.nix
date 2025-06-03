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
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          ms-python.python
          ms-python.vscode-pylance
          ms-python.debugpy
          ms-toolsai.jupyter
          ms-toolsai.jupyter-keymap
          ms-toolsai.jupyter-renderers
          ms-toolsai.vscode-jupyter-cell-tags
          ms-toolsai.vscode-jupyter-slideshow
          tomoki1207.pdf
        ];
      };
    };
  };
}
