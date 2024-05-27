{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hyprland.nix
    ./mako.nix
    ./zsh.nix
    ./rofi.nix
    ./clipman.nix
    ./udiskie.nix
    ./waybar.nix
    ./xdg.nix
    ./firefox.nix
    ./nixvim.nix
    ./git.nix
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  home.packages = with pkgs; [
    lxqt.lxqt-policykit
    wl-clipboard
    xdg-utils
    spotify
  ];

  home = {
    username = "julius";
    homeDirectory = "/home/julius";
  };

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };

  programs.kitty.enable = true;
  programs.home-manager.enable = true;
  programs.git.enable = true;
  services.blueman-applet.enable = true;
  services.network-manager-applet.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "23.11";
}
