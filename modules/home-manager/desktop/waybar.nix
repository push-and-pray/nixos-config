{osConfig, ...}: {
  programs.waybar = {
    enable = osConfig.modules.hyprland.enable;
    settings = [
      {
        spacing = 10;
        fixed-center = true;
        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "tray"
          "battery"
          "memory"
          "cpu"
          "temperature"
        ];
        "tray" = {
          show-passive-items = true;
        };
        "hyprland/workspaces" = {
          format = "|{icon}|";
        };
        clock = {
          "format" = "{:%H:%M}  ";
          "format-alt" = "{:%A, %B %d, %Y (%R)}";
          "tooltip-format" = "<tt><small>{calendar}</small></tt>";
        };
        cpu = {
          min-length = 6;
          format = " {usage}%";
          tooltip = true;
        };
        memory = {
          min-length = 6;
          format = " {}%";
        };
      }
    ];
  };
}
