{pkgs, ...}: {
  environment.systemPackages = [
    (pkgs.prismlauncher.override {jdks = [pkgs.jdk25];})
    pkgs.mangohud
    pkgs.legcord
  ];
}
