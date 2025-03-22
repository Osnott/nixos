{config, ...}: {
  programs.git = {
    enable = true;
    userName = "osnott";
    userEmail = "hi@osnott.xyz";
    extraConfig = {
      init.defaultBranch = "main";
      gpg.format = "ssh";

      push.autoSetupRemote = true;
      pull.rebase = false;
    };

    signing = {
      key = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
      signByDefault = true;
    };

    lfs.enable = true;
  };
}
