{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./git.nix
    ./zsh.nix
    ./direnv.nix
  ];

  home.packages = with pkgs; [
    kubectl
    kubeseal
    fluxcd
    teleport
    k9s
    inputs.nixvim.packages.${pkgs.stdenv.hostPlatform.system}.default
    curl
    wget
    dig
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    SUDO_EDITOR = "nvim";
  };

  programs.keychain = {
    enable = true;
    enableZshIntegration = true;
    keys = ["id_ed25519"];
  };

  programs.kitty.enable = true;
}
