{
  pkgs,
  ...
}: {
    services.mako = {
      enable = true;
      defaultTimeout = 10000;
    };

    home.packages = with pkgs; [
      libnotify
    ];
}
