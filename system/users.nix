{pkgs, ...}: {
  programs.zsh.enable = true;

  users.users = {
    julius = {
      uid = 1000;
      initialPassword = "password";
      isNormalUser = true;
      extraGroups = ["wheel" "networkmanager" "audio"];
      shell = pkgs.zsh;
    };
  };
}
