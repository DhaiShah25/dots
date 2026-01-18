{
  pkgs,
  lib,
  config,
  ...
}: {
  networking.hostName = "polaris";

  time.timeZone = "America/New_York";

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [
    # SSHD
    22

    # Browsing
    80
    443

    # Syncthing
    22000

    # Tinyproxy
    8888

    # Steam Link
    27036
    27037
  ];
  networking.firewall.allowedUDPPorts = [
    # Browsing
    443

    # Syncthing
    22000
    21027

    # Steam Link
    27031
    27036
  ];

  networking.firewall = {
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
    allowedUDPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
  };

  networking.networkmanager.enable = true;
  networking.wireless.iwd.enable = true;

  networking.wireless.iwd.settings = {
    IPv6 = {
      # My ISP Doesn't Support It Anyway
      Enabled = false;
    };
    Settings = {
      AutoConnect = true;
    };
  };

  networking.nameservers = ["127.0.0.1"];

  networking.networkmanager.wifi.backend = "iwd";
  networking.networkmanager.dns = "none";

  services.dnscrypt-proxy = {
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
