{pkgs, ...}: {
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.flatpak.enable = true;

  services.speechd.enable = true;

  services.displayManager.ly.enable = true;

  systemd.services.NetworkManager-wait-online.enable = false;

  services.libinput.enable = true;

  services.gvfs.enable = true;
  services.udisks2.enable = true;

  services.tailscale.enable = true;

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
