{pkgs, ...}: {
  /*
     packages = with pkgs; [
    rust-motd # motd configuration program
    figlet # ascii text art tool
  ];
  */

  programs.rust-motd = {
    enable = true;

    settings = {
      banner = {
        command = "${pkgs.hostname}/bin/hostname | ${pkgs.figlet}/bin/figlet -f slant";
        color = "light_magenta";
      };

      uptime = {
        prefix = "↑";
      };

      memory = {
        swap_pos = "beside";
      };

      last_login = {
        osnott = 3;
      };

      filesystems = {
        root = "/";
      };
    };

    order = [
      "banner"
      "memory"
      "filesystems"
      "uptime"
      "last_login"
    ];

    enableMotdInSSHD = true;
  };
}
