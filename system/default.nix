{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./core
    ./networking.nix
    ./stylix.nix
    ./media.nix
    ./users.nix
    ./greetd.nix
    ./hyprland.nix
  ];

  virtualisation.docker.enable = true;
  users.extraGroups.docker.members = ["julius"];
  services.udisks2.enable = lib.mkDefault true;

  environment.systemPackages = with pkgs; [
    neovim
  ];
}
