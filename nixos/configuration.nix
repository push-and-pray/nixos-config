{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager

    ./stylix.nix
    ./nix.nix
    ./bootloader.nix
    ./locale.nix
    ./media.nix
    ./users.nix
    ./networking.nix
    ./greetd.nix
    ./hardware-configuration.nix
  ];

  services.udisks2.enable = true;

  security.pam.services.hyprlock = {};
  programs.hyprland = {
    enable = true;
  };


  environment.systemPackages = with pkgs; [
    qt6.qtwayland
    libsForQt5.qt5.qtwayland
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      julius = import ../home-manager/home.nix;
    };
  };

  system.stateVersion = "23.11";
}
