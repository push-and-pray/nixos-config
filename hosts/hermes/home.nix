{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nix-index-database.homeModules.nix-index
  ];
  programs.nix-index-database.comma.enable = true;
  programs.nix-index.enable = true;

  home.stateVersion = "25.05";

  home = {
    username = "julius";
    homeDirectory = "/home/julius";

    packages = with pkgs; [
      hcloud
      talosctl
      jq
      wget
      killall
      ripgrep
      tree
      unzip
      zip
      kubectl
      kubernetes-helm
      teleport
      inputs.nixvim.packages."x86_64-linux".default
    ];
  };
  programs = {
    home-manager.enable = true;

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    git = {
      enable = true;
      userEmail = "62392537+push-and-pray@users.noreply.github.com";
      userName = "push-and-pray";
      delta.enable = true;
    };

    lazygit = {
      enable = true;
    };

    zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
      };
    };
  };
}
