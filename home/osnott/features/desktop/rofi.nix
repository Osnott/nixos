{config, pkgs, ...}: {
  programs.rofi = {
    enable = true;
    terminal = "${pkgs.kitty}/bin/kitty";
    modes = [ "drun" ];
    extraConfig = {
      disable-history = false;
      display-drun = "   Apps ";
      icon-theme = "Papirus";
      drun-display-format = "{icon} {name}";
      hide-scrollbar = true;
      sidebar-mode = true;
      location = 0;
    };
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        width = 800;
        font = "FiraCode Nerd Font 14";
      };

      "#inputbar" = {
        "children" = map mkLiteral ["prompt" "entry"];
        "border-radius" = mkLiteral "5px";
        "padding" = mkLiteral "2px";
        "background-color" = mkLiteral "@base";
      };

      "#prompt" = {
        "background-color" = mkLiteral "@pink";
        "padding" = mkLiteral "6px";
        "text-color" = mkLiteral "@base";
        "border-radius" = mkLiteral "3px";
        "margin" = mkLiteral "20px 0px 0px 20px";
      };

      "#window" = {
        "height" = mkLiteral "360px";
        "border" = mkLiteral "3px";
        "border-color" = mkLiteral "@base";
        "background-color" = mkLiteral "@base";
        "border-radius" = mkLiteral "10px";
      };

      "mainbox" = {
        "background-color" = mkLiteral "@base";
      };

      "#listview" = {
        "border" = mkLiteral "0px 0px 0px";
        "padding" = mkLiteral "6px 0px 0px";
        "margin" = mkLiteral "10px 0px 0px 20px";
        "columns" = 2;
        "lines" = 6;
      };

      "#textbox-prompt-colon" = {
        "expand" = false;
        "str" = mkLiteral "\":\"";
      };

      "#message" = {
        "margin" = mkLiteral "2px";
        "padding" = mkLiteral "2px";
        "border-radius" = mkLiteral "5px";
      };

      "#textbox" = {
        "padding" = mkLiteral "6px";
        "margin" = mkLiteral "20px 0px 0px 20px";
        "text-color" = mkLiteral "@pink";
      };

      "#entry" = {
        "padding" = mkLiteral "6px";
        "margin" = mkLiteral "20px 0px 0px 10px";
        "text-color" = mkLiteral "@text";
        "background-color" = mkLiteral "@base";
      };

      "#element" = {
        "padding" = mkLiteral "5px";
        "background-color" = mkLiteral "@base";
        "text-color" = mkLiteral "@text";
      };

      "#element-icon" = {
        "size" = mkLiteral "25px";
      };

      "#element selected" = {
        "background-color" = mkLiteral "@base";
        "text-color" = mkLiteral "@pink";
      };

      "#mode-switcher" = {
        "spacing" = 0;
      };

      "#button" = {
        "padding" = mkLiteral "10px";
        "background-color" = mkLiteral "@base";
        "text-color" = mkLiteral "@overlay0";
        "vertical-align" = mkLiteral "0.5";
        "horizontal-align" = mkLiteral "0.5";
      };

      "@import" = "catppuccin-mocha";
    };
  };

  catppuccin = {
    rofi.enable = true;
  };
}

