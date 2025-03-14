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
