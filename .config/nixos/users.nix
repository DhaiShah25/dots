{
  config,
  pkgs,
  lib,
  ...
}: {
  users.users.gale = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
    packages = with pkgs; [];
    shell = pkgs.nushell;
  };

  users.users.git = {
    isSystemUser = true;
    group = "git";
    home = "/var/lib/git-server";
    createHome = true;
    shell = "${pkgs.git}/bin/git-shell";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOQgcbZoe+FSp6SWAClIB/87LuTxQgVlETuaOITBxVdo gale@polaris"
    ];
  };

  users.groups.git = {};
}
