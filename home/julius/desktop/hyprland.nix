{
  pkgs,
  osConfig,
  ...
}: {
  home.packages = with pkgs; [
    brightnessctl
    playerctl
    lxqt.lxqt-policykit
    wl-clipboard
  ];

  services.hyprpaper = {
    enable = true;
    package = pkgs.unstable.hyprpaper;
    settings = {
      preload = [
        "/etc/nixos/res/wallpaper.png"
      ];
      wallpaper = [
        ",/etc/nixos/res/wallpaper.png"
      ];
      splash = true;
      ipc = false;
    };
  };

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
      };
      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blue_size = 8;
        }
      ];
      input-field = [
        {
          monitor = "";
          size = "400, 100";
          position = "0, -80";
          placeholder_text = "Password...";
        }
      ];
    };
  };

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };
      listener = [
        {
          timeout = 100;
          on-timeout = "brightnessctl -s set 2%";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 230;
          on-timeout = "notify-send 'Locking screen soon...'";
        }
        {
          timeout = 240;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 300;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.variables = ["--all"];
    settings = {
      monitor = osConfig.programs.hyprland.monitors;
      input = {
        kb_layout = "dk";
      };

      exec-once = [
        "waybar"
        "lxqt-policykit-agent"
        "wl-paste -t text --watch clipman store --no-persist"
      ];

      bind = [
        "SUPER,Return,exec,kitty"
        "SUPER,Space,exec,rofi -show drun"
        "SUPER, V, exec, clipman pick -t rofi"
        "SUPER, L, exec, hyprlock"

        ",XF86MonBrightnessDown,exec,brightnessctl set 20%-"
        ",XF86MonBrightnessUp,exec,brightnessctl set +20%"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioPlay, exec, playerctl play-pause"

        "SUPER,q,killactive"
        "SUPER,f,fullscreen"

        "SUPER,Right,movefocus,r"
        "SUPER,Left,movefocus,l"
        "SUPER,Up,movefocus,u"
        "SUPER,Down,movefocus,d"

        "SUPER_SHIFT,Right,movewindow,r"
        "SUPER_SHIFT,Left,movewindow,l"
        "SUPER_SHIFT,Up,movewindow,u"
        "SUPER_SHIFT,Down,movewindow,d"

        "SUPER,1,workspace,1"
        "SUPER,2,workspace,2"
        "SUPER,3,workspace,3"
        "SUPER,4,workspace,4"
        "SUPER,5,workspace,5"
        "SUPER,6,workspace,6"
        "SUPER,7,workspace,7"
        "SUPER,8,workspace,8"
        "SUPER,9,workspace,9"
        "SUPER,0,workspace,10"

        "SUPER_SHIFT,1,movetoworkspacesilent,1"
        "SUPER_SHIFT,2,movetoworkspacesilent,2"
        "SUPER_SHIFT,3,movetoworkspacesilent,3"
        "SUPER_SHIFT,4,movetoworkspacesilent,4"
        "SUPER_SHIFT,5,movetoworkspacesilent,5"
        "SUPER_SHIFT,6,movetoworkspacesilent,6"
        "SUPER_SHIFT,7,movetoworkspacesilent,7"
        "SUPER_SHIFT,8,movetoworkspacesilent,8"
        "SUPER_SHIFT,9,movetoworkspacesilent,9"
        "SUPER_SHIFT,0,movetoworkspacesilent,10"
      ];

      misc = {
        #  disable_splash_rendering = true;
        disable_hyprland_logo = true;
      };
    };
    extraConfig = ''
    '';
  };

  home.sessionVariables = {
    GDK_BACKEND = "wayland,x11,*";
    QT_QPA_PLATFORM = "wayland;xcb";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";

    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";

    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    NIXOS_OZONE_WL = "1";
  };
}
