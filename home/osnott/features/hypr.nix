{config, lib, ...}:
let
  wallpaper = "$HOME/.wallpapers/ralsei.jpg";
in {
  wayland.windowManager.hyprland = { 
    enable = true;

    settings = {
      "env" = [ 
        "LIBVA_DRIVER_NAME,nvidia"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      ];

      "exec-once" = [
        # annoyingly the env vars dont work for some reason
        "hyprctl setcursor macOS 24"
      ];

      "monitor" = [
        "HDMI-A-2, 2560x1440@74.59900, 0x0, 1"
        "HDMI-A-1, 2560x1440@74.59900, 2560x0, 1"
        "DP-2, 1920x1080@60, 5120x360, 1"
      ];
      
      general = {
        "gaps_in" = 5;
        "gaps_out" = 20;
        "border_size" = 2;
        "col.active_border" = "rgba(94e2d5cc) rgba(cba6f7cc) 45deg";
        "col.inactive_border" = "rgba(59595955)";
        "layout" = "dwindle";
      };

      decoration = {
        blur = {
          "size" = 3;
          "passes" = 1;
          "new_optimizations" = true;
        };

        shadow = {
          "enabled" = true;
          "range" = 4;
          "render_power" = 3;
          "color" = "rgba(1a1a1aee)";
        };

        "rounding" = 10;

        "active_opacity" = 1;
        "inactive_opacity" = 0.95;
        "fullscreen_opacity" = 1;
      };

      "windowrule" = [
        "opacity 1.0 override 1.0 override 1.0 override, class:^(zen-twilight)$"
      ];

      "layerrule" = [
        "ignorealpha 0, ^(rofi)$"
        "dimaround, ^(rofi)$"
      ];

      animations = {
        "enabled" = "yes";

        "bezier" = "bezier, 0.05, 0.9, 0.1, 1.05";

        "animation" = [
          "windows, 1, 7, bezier"
          "windowsMove, 1, 7, bezier, slide"
          "windowsIn, 1, 7, default, slide"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
          "layers, 1, 4, bezier, slide"
        ];
      };

      "$mod" = "SUPER";
      bind = [
        "$mod, C, killactive"
        "$mod, M, exit"
        "$mod, F, fullscreen"

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"

        (lib.mkIf (config.programs.kitty.enable) "$mod, RETURN, exec, kitty")
        (lib.mkIf (config.programs.kitty.enable) "$mod SHIFT, RETURN, exec, [float;center;size 65%] kitty")
        (lib.mkIf (config.programs.rofi.enable) "$mod, R, exec, rofi -show drun -show-icons")
        (lib.mkIf (config.programs.hyprlock.enable) "$mod SHIFT, L, exec, hyprlock")
      ]
      ++ (
          builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )9)
          );

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };

  services.hyprpaper = {
    enable = true;

    settings = {
      ipc = true;
      splash = false;
      disable_hyprland_logo = true;
      force_default_wallpaper = 0;

      preload = [
        (builtins.toString wallpaper)
      ];

      wallpaper = [
        ",${builtins.toString wallpaper}"
      ];
    };
  };

  programs.hyprlock = {
    enable = true;

    settings = {
      background = {
        monitor = "";
        path = (builtins.toString wallpaper);
        color = "rgba(30, 30, 46, 0.9)";

        blur_passes = 3;
        blur_size = 7;
        noise = 0.0117;
        contrast = 0.8916;
        brightness = 0.8172;
        vibrancy = 0.0250;
        vibrancy_darkness = 0.5;
      };

      input-field = {
        monitor = "";
        size = "400, 100";
        outline_thickness = 2;
        dots_size = 0.11;
        dots_spacing = 0.10;
        dots_center = true;
        placeholder_text = "";
        fail_text = "<i>$FAIL</i>";
        hide_input = false;
        outer_color = "rgb(203, 166, 257)";
        inner_color = "rgb(30, 30, 46)";
        fade_on_empty = true;
        font_color = "rgb(205, 214, 244)";

        position = "0, -20";
        halign = "center";
        valign = "center";
      };

      label = {
        monitor = "";
        text = "$TIME";
        color = "rgba(200, 200, 200, 1.0)";
        position = "0, 425";
        font_size = 55;
        font_family = "FiraCode Bold Italic";

        halign = "center";
        valign = "center";
      };
    };
  };

  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd = "hyprlock";
      };

      listener = [
        {
          timeout = 500;
          on-timeout = "hyprlock";
        }
      ];
    };
  };
}
