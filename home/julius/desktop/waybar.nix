{
  pkgs,
  config,
  ...
}: {
  programs.waybar = {
    enable = true;
    package = pkgs.unstable.waybar;
    settings = [
      {
        spacing = 10;
        fixed-center = true;
        modules-left = [
          "hyprland/workspaces"
          "cava"
        ];
        modules-center = [
          "clock"
          "idle_inhibitor"
        ];
        modules-right = [
          "cpu"
          "memory"
          "temperature"
          "pulseaudio"
          "backlight"
          "network"
          "bluetooth"
          "battery"
        ];
        "hyprland/workspaces" = {
          format = "|{icon}|";
        };
        "cava" = {
          hide_on_silence = false;
          framerate = 60;
          format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
        };
        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "󰥔";
            deactivated = "";
          };
        };
        "temperature" = {
          hwmon-path = "/sys/class/hwmon/hwmon4/temp1_input";
          critical-threshold = 83;
          format = "{icon} {temperatureC}°C";
          format-icons = ["" "" ""];
          interval = 10;
        };
        clock = {
          "format" = "{:%H:%M}";
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
  systemd.user.services.waybar = {
    Unit = {
      Description = "Highly customizable Wayland bar for Sway and Wlroots based compositors.";
      Documentation = "https://github.com/Alexays/Waybar/wiki";
      After = ["graphical-session.target"];
    };

    Service = {
      ExecStart = "${config.programs.waybar.package}/bin/waybar";
      ExecReload = "${pkgs.coreutils}/bin/kill -SIGUSR2 $MAINPID";
      Restart = "on-failure";
      KillMode = "mixed";
    };

    Install = {WantedBy = ["graphical-session.target"];};
  };
}
