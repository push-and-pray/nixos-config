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
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    # Modesetting is required.
    modesetting.enable = true;
  };
  programs.hyprland.monitors = [
    "DP-2,2560x1440@144,0x0,1"
    "HDMI-A-2, 2560x1440@144, -1440x-720,1,transform,1"
    "Unknown-1,disable"
  ];
  networking.firewall.enable = false;
  boot.loader.grub.useOSProber = true;
  system.stateVersion = "23.11";
}
