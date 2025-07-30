{pkgs, inputs, ...}: {
  imports = [
    inputs.zen-browser.homeModules.twilight
    inputs.catppuccin.homeModules.catppuccin

    ./kitty.nix
    ./fonts.nix
    ./rofi.nix
    ./gtk.nix
  ];

  programs.zen-browser.enable = true;
  programs.vesktop.enable = true;
  
  catppuccin = {
    enable = false;
    flavor = "mocha";
    accent = "lavender";
  };

  home.pointerCursor = {
    name = "macOS";
    package = pkgs.apple-cursor;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  home.packages = with pkgs; [
    wayvnc
    puredata
  ];
}
