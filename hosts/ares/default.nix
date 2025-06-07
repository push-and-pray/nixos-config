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

  services.udev.packages = [
    (pkgs.writeTextFile {
      name = "52-xilinx-digilent-usb.rules";
      text = ''
        ATTR{idVendor}=="1443", MODE:="666"
        ACTION=="add", ATTR{idVendor}=="0403", ATTR{manufacturer}=="Digilent", MODE:="666"
      '';
      destination = "/etc/udev/rules.d/52-xilinx-digilent-usb.rules";
    })

    (pkgs.writeTextFile {
      name = "52-xilinx-ftdi-usb.rules";
      text = ''
        ACTION=="add", ATTR{idVendor}=="0403", ATTR{manufacturer}=="Xilinx", MODE:="666"
      '';
      destination = "/etc/udev/rules.d/52-xilinx-ftdi-usb.rules";
    })

    (pkgs.writeTextFile {
      name = "52-xilinx-pcusb.rules";
      text = ''
        ATTR{idVendor}=="03fd", ATTR{idProduct}=="0007", MODE="666"
        ATTR{idVendor}=="03fd", ATTR{idProduct}=="0008", MODE="666"
        ATTR{idVendor}=="03fd", ATTR{idProduct}=="0009", MODE="666"
        ATTR{idVendor}=="03fd", ATTR{idProduct}=="000d", MODE="666"
        ATTR{idVendor}=="03fd", ATTR{idProduct}=="000f", MODE="666"
        ATTR{idVendor}=="03fd", ATTR{idProduct}=="0013", MODE="666"
        ATTR{idVendor}=="03fd", ATTR{idProduct}=="0015", MODE="666"
      '';
      destination = "/etc/udev/rules.d/52-xilinx-pcusb.rules";
    })
  ];

  services.xserver.videoDrivers = ["modesetting" "nvidia"];
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia = {
      modesetting.enable = true;
      powerManagement = {
        enable = true;
        finegrained = true;
      };
      open = true;
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        intelBusId = "PCI:00:02:0";
        nvidiaBusId = "PCI:01:00:0";
      };
    };
    enableRedistributableFirmware = true;
  };

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub.useOSProber = true;
  };

  programs.hyprland.monitors = [
    "eDP-1,preferred,auto,2"
    "DP-4,preferred,auto,2,mirror,eDP-1"
  ];
  services = {
    fstrim.enable = true;
    fwupd.enable = true;
    thermald.enable = true;
  };

  networking.firewall.enable = false;

  system.stateVersion = "23.11";
}
