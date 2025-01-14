{...}: {
  imports = [
    ./clipman.nix
    ./git.nix
    ./nixvim
    ./zsh.nix
    ./direnv.nix
  ];

  programs.kitty.enable = true;
}
