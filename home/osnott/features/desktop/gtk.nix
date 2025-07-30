{pkgs, ...}: {
  catppuccin.gtk = {
    enable = true;
    accent = "pink";
    size = "standard";
    tweaks = [ "normal" ];
  };

  gtk = {
    enable = true;

    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };
}
