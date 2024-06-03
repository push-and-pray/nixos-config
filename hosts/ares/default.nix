{
  inputs,
  outputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs;};
    users = {
      julius = import ../../home/julius;
    };
  };

  programs.hyprland.monitors = ["eDP-1,preferred,auto,2"];

  networking.firewall.enable = false;

  system.stateVersion = "23.11";
}
