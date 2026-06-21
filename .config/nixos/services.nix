{...}: {
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.flatpak.enable = true;

  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = ["*"];
        settings = {
          main = {
            capslock = "overload(control, esc)";
            esc = "capslock";
          };
          otherlayer = {};
        };
      };
    };
  };

  services.speechd.enable = true;

  services.displayManager.ly.enable = true;

  systemd.services.NetworkManager-wait-online.enable = false;

  services.libinput.enable = true;

  services.gvfs.enable = true;
  services.udisks2.enable = true;

  services.tailscale.enable = true;

  systemd.oomd.enable = true;

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = ["git" "gale"];
    };
  };
}
