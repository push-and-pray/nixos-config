{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nix-index-database.homeModules.nix-index
    ../../home/julius/shell
  ];
  programs.nix-index-database.comma.enable = true;
  programs.nix-index.enable = true;

  home.stateVersion = "25.05";

  home = {
    username = "julius";
    homeDirectory = "/home/julius";


  };
  programs = {
    home-manager.enable = true;


  };
}
