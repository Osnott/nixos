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

    ../common/optional/grafana.nix
    ../common/optional/prometheus.nix
    ../common/optional/loki.nix
    ../common/optional/promtail.nix
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
