{pkgs, ...}: {
  imports = [
    ./clipman.nix
    ./git.nix
    ./nixvim
    ./zsh.nix
    ./direnv.nix
  ];

  home.packages = with pkgs; [
    kubectl
    kubeseal
    fluxcd
  ];

  programs.kitty.enable = true;
}
