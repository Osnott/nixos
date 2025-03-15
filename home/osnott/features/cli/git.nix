{config, ...}: {
  programs.git = {
    enable = true;
    userName = "osnott";
    userEmail = "hi@osnott.xyz";
    extraConfig = {
      init.defaultBranch = "main";
      gpg.format = "ssh";

      push.autoSetupRemote = true;
    };

    signing = {
      key = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
      signByDefault = true;
    };

    lfs.enable = true;
  };
}
