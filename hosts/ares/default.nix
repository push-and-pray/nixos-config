{
  inputs,
  outputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];
  boot = {
    # nixos-facter mislabels my ethernet device
    extraModulePackages = [pkgs.linuxPackages.yt6801];
    kernelModules = ["kvm-amd" "yt6801"];
    loader.efi.canTouchEfiVariables = true;
  };

  programs.hyprland.monitors = [",preferred,auto,1.5"];

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs;};
    users = {
      julius = import ../../home/julius;
    };
  };

  services = {
    fstrim.enable = true;
    fwupd.enable = true;
    thermald.enable = true;
  };

  system.stateVersion = "25.05";
}
