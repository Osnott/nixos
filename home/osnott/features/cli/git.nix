{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "osnott";
    userEmail = "hi@osnott.xyz";
    extraConfig = {
      init.defaultBranch = "main";

      # TODO: gpg commit signing

      push.autoSetupRemote = true;
    };

    lfs.enable = true;
  };
}
