{
  pkgs,
  lib,
  inputs,
}: {
  networking.hostName = "polaris";

  time.timeZone = "America/New_York";

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [22000 8080 3000 5000 23231 8888 5173];
  networking.firewall.allowedUDPPorts = [22000];

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

  networking.nameservers = ["127.0.0.1"];

  networking.networkmanager.wifi.backend = "iwd";
  networking.networkmanager.dns = "none";

  services.dnscrypt-proxy2 = {
    enable = true;
    settings = {
      ipv6_servers = false;
      require_dnssec = true;
      sources.public-resolvers = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
          "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
        ];
        cache_file = "/var/cache/dnscrypt-proxy/public-resolvers.md";
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
      };
    };
  };
}
