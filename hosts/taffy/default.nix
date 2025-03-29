{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/users/osnott

    ../common/optional/motd.nix
    ../common/optional/flux
  ];

  networking.hostName = "taffy";

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  time.timeZone = "America/Pheonix";

  system.stateVersion = "24.11";
}
