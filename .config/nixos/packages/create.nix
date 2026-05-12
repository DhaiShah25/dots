{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    inkscape
    blender
    blockbench
    godot
    obsidian
    krita
    goxel
  ];
}
