{
  lib,
  config,
  pkgs,
  ...
}: {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time";
        user = "greeter";
      };
    };
  };
  boot.kernelParams = ["console=tty1"];
  services.greetd.vt = 2;
}
