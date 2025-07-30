{pkgs, ...}: {
  fonts.fontconfig.enable = true;

  home.packages = [
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.fira-mono
    pkgs.nerd-fonts.bigblue-terminal

    pkgs.open-sans

    pkgs.corefonts
    pkgs.vistafonts
  ];
}
