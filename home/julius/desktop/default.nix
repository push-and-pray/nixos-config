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
    signal-desktop-bin
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
