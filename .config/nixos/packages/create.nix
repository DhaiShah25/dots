{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    inkscape
    krita

    godot
    blender
    blockbench
    butler

    kdePackages.kdenlive

    drawy
    obsidian

    audacity
  ];
}
