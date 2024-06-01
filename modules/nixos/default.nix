{
  lib,
  config,
  ...
}: {
  imports = [
    ./networking.nix
    ./bootloader.nix
    ./stylix.nix
    ./nix.nix
    ./locale.nix
    ./media.nix
    ./users.nix
    ./greetd.nix
    ./hyprland.nix
  ];


  options = {
    modules.docker.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf config.modules.docker.enable {
    virtualisation.docker.enable = true;
    users.extraGroups.docker.members = ["julius"];
    services.udisks2.enable = lib.mkDefault true;
  };
}
