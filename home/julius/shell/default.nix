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
    kubelogin-oidc
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    SUDO_EDITOR = "nvim";
  };

  programs.kitty.enable = true;
}
