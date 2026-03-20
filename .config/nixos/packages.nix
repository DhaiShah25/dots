{
  pkgs,
  lib,
  ...
}: let
  categories = ["cli" "desktop" "dev" "fun" "misc" "utils" "create"];

  packageLists = map (name: import ./packages/${name}.nix {inherit pkgs;}) categories;

  myPackages = lib.concatLists packageLists;
in {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = myPackages;

  programs.hyprland.enable = true;

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  programs.xwayland.enable = true;

  programs.steam = {
    enable = true;
    extraCompatPackages = [pkgs.proton-ge-bin];
  };

  programs.gnupg.agent = {
    enable = true;
  };

  programs.obs-studio = {
    enable = true;

    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-pipewire-audio-capture
      obs-vkcapture
    ];
  };

  programs.git = {
    enable = true;
    config = {
      init = {defaultBranch = "main";};
    };
  };

  programs.nano.enable = false;
}
