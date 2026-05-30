{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (prismlauncher.override {jdks = [jdk25];})
    mangohud
    legcord
  ];
}
