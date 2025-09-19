{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  networking.hostName = "polaris";

  time.timeZone = "America/New_York";

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [22000 8080 3000 5000 23231 8888];
  networking.firewall.allowedUDPPorts = [22000];

  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = ["~."];
    fallbackDns = ["9.9.9.9" "149.112.112.112"];
  };

  networking.networkmanager.enable = true;
  networking.wireless.iwd.enable = true;

  networking.wireless.iwd.settings = {
    IPv6 = {
      Enabled = true;
    };
    Settings = {
      AutoConnect = true;
    };
  };

  networking.nameservers = ["9.9.9.9" "149.112.112.112"];

  networking.networkmanager.wifi.backend = "iwd";
  networking.networkmanager.dns = "systemd-resolved";
}
