{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    inkscape
    krita

    blender
    butler

    kdePackages.kdenlive

    drawy
    obsidian

    audacity
  ];
}
