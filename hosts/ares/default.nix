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
  boot = {
    # nixos-facter mislabels my ethernet device
    extraModulePackages = [config.boot.kernelPackages.yt6801];
    kernelModules = ["yt6801"];
    blacklistedKernelModules = ["r8169"];
  };

  virtualisation.docker.enableOnBoot = false;
  systemd.services.NetworkManager-wait-online.enable = false;

  programs.hyprland.monitors = [",preferred,auto,1.6"];

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs;};
    users = {
      julius = {
        imports = [../../home/julius];
        home.stateVersion = "25.05";
      };
    };
  };

  services = {
    fstrim.enable = true;
    fwupd.enable = true;
  };

  zramSwap.enable = true;

  boot.kernelParams = [
    "amd_pstate=active"
  ];

  services.power-profiles-daemon.enable = true;

  system.stateVersion = "25.05";
}
