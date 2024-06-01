{pkgs, ...}: {
  programs.zsh.enable = true;

  users.users = {
    julius = {
      initialPassword = "password";
      isNormalUser = true;
      extraGroups = ["wheel" "networkmanager" "audio" "docker"];
      shell = pkgs.zsh;
    };
  };
}
