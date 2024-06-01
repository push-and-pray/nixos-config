{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    modules.users.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf config.modules.users.enable {
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
  };
}
