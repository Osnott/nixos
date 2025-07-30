{config, lib, pkgs, ...}: {
  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    # Enable OpenGL
    graphics.enable = true;

    nvidia = {
      modesetting.enable =  true;

      # Experimental, enable if graphical corruptions issues occur after waking from sleep.
      powerManagement.enable = false;

      # Experimental, turns off GPU when not in use.
      powerManagement.finegrained = false;

      # Use nvidia open source kernel module
      open = true;

      # Enable nvidia settings menu
      nvidiaSettings = true;

      # Select appropriate driver version
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
}
