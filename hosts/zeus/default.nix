{
  inputs,
  outputs,
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia.open = true;

  programs.hyprland.monitors = [
    "DP-1,preferred,0x0,1.6"
    "HDMI-A-2,preferred,-900x-450,1.6,transform,1"
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs;};
    users = {
      julius = {
        imports = [../../home/julius];
        home.stateVersion = "25.11";
      };
    };
  };

  services = {
    fstrim.enable = true;
    fwupd.enable = true;
  };

  zramSwap.enable = true;

  system.stateVersion = "25.11";
}
