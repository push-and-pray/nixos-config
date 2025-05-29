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

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs;};
    users = {
      julius = import ../../home/julius;
    };
  };

  specialisation = {
    nvidia-sync.configuration = {
      hardware.nvidia.prime.sync.enable = lib.mkForce true;
      hardware.nvidia.prime.offload = {
        enable = lib.mkForce false;
        enableOffloadCmd = lib.mkForce false;
      };
    };
  };

  services.xserver.videoDrivers = ["nvidia"];
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
      ];
    };
    nvidia = {
      modesetting.enable = true;
      open = true;
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        sync.enable = false;
        intelBusId = "PCI:00:02:0";
        nvidiaBusId = "PCI:01:00:0";
      };
    };
    enableRedistributableFirmware = true;
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    NVD_BACKEND = "direct";
  };

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub.useOSProber = true;
  };

  programs.hyprland.monitors = [",preferred,auto,2"];
  services = {
    fstrim.enable = true;
    fwupd.enable = true;
    thermald.enable = true;
  };

  networking.firewall.enable = false;

  system.stateVersion = "23.11";
}
