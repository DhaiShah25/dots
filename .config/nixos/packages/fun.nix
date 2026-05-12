{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    prismlauncher
    mcrcon
    cava
    mangohud
    legcord
  ];
}
