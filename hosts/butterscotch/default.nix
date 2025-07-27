{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/users/osnott

    ../common/optional/nvidia.nix
    ../common/optional/hyprland.nix
    ../common/optional/sddm.nix
  ];

  networking.hostName = "butterscotch";
  networking.networkmanager.enable = true;

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        devices = [ "nodev" ];
        efiSupport = true;
        useOSProber = true;
      };
    };
  };

  time.timeZone = "America/Pheonix";

  system.stateVersion = "25.05";
}
