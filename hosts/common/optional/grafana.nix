{config, ...}: {
  services.grafana = {
    enable = true;

    settings = {
      analytics.reporting = false;

      server = {
        http_port = 3000;
        http_addr = "";
      };
    };
  };

  networking.firewall.allowedTCPPorts = [3000];
  networking.firewall.allowedUDPPorts = [3000];
}
