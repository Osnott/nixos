{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ../features/cli
  ];

  systemd.user.startServices = "sd-switch";

  home = {
    username = "osnott";
    homeDirectory = "/home/osnott";

    stateVersion = "23.11";
  };

  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;
  programs.home-manager.enable = true;
  programs.git.enable = true;

}
