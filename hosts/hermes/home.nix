{
  pkgs,
  ...
}: {
  home.stateVersion = "24.05";

  home = {
    username = "julius";
    homeDirectory = "/home/julius";

    sessionVariables.EDITOR = "nvim";

    packages = with pkgs; [
      jq
      killall
      ripgrep
      tree
      unzip
      zip
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
      userEmail = "62392537+ketamin00@users.noreply.github.com";
      userName = "ketamin00";
    };

    lazygit.enable = true;
    zsh = {
      enable = true;
      initExtra = ''
        path+=('/mnt/c/Users/juliu/scoop/apps/win32yank/0.1.1')
      '';
      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
      };
    };
  };
}
