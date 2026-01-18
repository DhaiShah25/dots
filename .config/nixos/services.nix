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
        command = "${pkgs.tuigreet}/bin/tuigreet --remember-session --time --theme text=\x1b[38;2;198;208;245m;time=lightmagenta;container=darkgray;border=lightmagenta;title=lightmagenta;greet=lightmagenta;prompt=lightcyan;input=lightyellow;action=lightmagenta;button=lightblue";
        user = "greeter";
      };
    };
  };

  systemd.services.NetworkManager-wait-online.enable = false;

  services.libinput.enable = true;

  services.gvfs.enable = true;
  services.udisks2.enable = true;

  services.flatpak.enable = true;

  services.tailscale.enable = true;

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = ["git"];
    };
  };

  services.fwupd.enable = true;

  services.logind.lidSwitch = "suspend-then-hibernate";
}
