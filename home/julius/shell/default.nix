{
  pkgs,
  inputs,
  system,
  ...
}: {
  imports = [
    ./clipman.nix
    ./git.nix
    ./zsh.nix
    ./direnv.nix
  ];

  home.packages = with pkgs; [
    kubectl
    kubeseal
    fluxcd
    inputs.nixvim.packages.${system}.default
  ];

  programs.kitty.enable = true;
}
