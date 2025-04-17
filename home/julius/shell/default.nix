{
  pkgs,
  inputs,
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
    inputs.nixvim.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  programs.kitty.enable = true;
}
