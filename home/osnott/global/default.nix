{
  outputs,
  lib,
  pkgs,
  ...
}: {
  imports =
    [
      ../features/cli
    ]
    ++ (builtins.attrValues outputs.homeManagerModules);

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
        #"ca-derivations"
      ];
      warn-dirty = false;
    };
  };

  systemd.user.startServices = "sd-switch";

  home = {
    username = "osnott";
    homeDirectory = "/home/osnott";

    stateVersion = "23.11";
  };

  programs = {
    home-manager.enable = true;
    git.enable = true;
  };
}
