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
  ];

  programs.kitty.enable = true;
}
