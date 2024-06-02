{pkgs, ...}: {
  security.pam.services.hyprlock = {};
  programs.hyprland = {
    enable = true;
  };
  environment.systemPackages = with pkgs; [
    qt6.qtwayland
    libsForQt5.qt5.qtwayland
  ];
}
