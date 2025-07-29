{...}: {
  programs.kitty = {
    enable = true;
    settings = {
      font_size = 12;
      disable_ligatures = "never";
      enable_audio_bell = "no";
      window_padding_width = 4;
      cursor_shape = "block";
      shell_integration = "no-cursor";
      confirm_os_window_close = 0;
      font_family = "family='BigBlueTermPlus Nerd Font Mono'";
    };
  };

  catppuccin.kitty.enable = true;
}
