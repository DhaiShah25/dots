{
  pkgs,
  lib,
  config,
  ...
}: {
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --remember-session --time --theme text=white;time=lightmagenta;container=darkgray;border=lightmagenta;title=lightmagenta;greet=lightmagenta;prompt=lightcyan;input=lightyellow;action=lightmagenta;button=lightblue";
        user = "greeter";
      };
    };
  };

  systemd.services.NetworkManager-wait-online.enable = false;

  services.libinput.enable = true;

  services.power-profiles-daemon.enable = true;

  services.gvfs.enable = true;
  services.udisks2.enable = true;

  services.flatpak.enable = true;

  services.tailscale.enable = true;

  services.soft-serve = {
    enable = true;

    settings = {
      name = "Polaris Repos";
      log_format = "text";
      ssh = {
        listen_addr = ":23231";
        public_url = "ssh://polaris:23231";
        max_timeout = 30;
        idle_timeout = 120;
      };
      initial_admin_keys = ["\"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJBhLma7WBBim2qRpEThT1OZNZB2AVdncK3bPsvzN0s/ gale@polaris\""];
    };
  };

  services.fwupd.enable = true;

  services.blueman.enable = true;
}
