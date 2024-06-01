{...}: {
  imports = [
    ./clipman.nix
    ./git.nix
    ./nixvim.nix
    ./zsh.nix
    ./direnv.nix
  ];

  programs.kitty.enable = true;
}
