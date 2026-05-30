{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    inkscape
    krita

    godot
    blender
    blockbench
    butler

    drawy
    obsidian
    logseq

    neovim
    evil-helix
  ];
}
