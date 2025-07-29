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

  home.packages = with pkgs; [
    wayvnc
    puredata
  ];
}
