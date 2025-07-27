{pkgs, ...}: {
  wayland.windowManager.hyprland = { 
    enable = true;

    settings = {
      "env" = [ "LIBVA_DRIVER_NAME,nvidia" "__GLX_VENDOR_LIBRARY_NAME,nvidia" ];

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
        "$mod, RETURN, exec, kitty"
        "$mod, C, killactive"
        "$mod, M, exit"
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
    };
  };
}
