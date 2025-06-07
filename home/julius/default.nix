{
  outputs,
  osConfig,
  inputs,
  ...
}: {
  imports = [
    ./desktop
    ./shell
    inputs.nix-index-database.hmModules.nix-index
  ];
  programs.nix-index-database.comma.enable = true;
  programs.nix-index.enable = true;

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "julius";
    homeDirectory = "/home/julius";
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";
  services.blueman-applet.enable = osConfig.services.blueman.enable;
  services.network-manager-applet.enable = osConfig.networking.networkmanager.enable;
  services.udiskie.enable = osConfig.services.udisks2.enable;

  home.stateVersion = "23.11";
}
