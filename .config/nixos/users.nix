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
}
