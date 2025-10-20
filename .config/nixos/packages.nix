{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: let
  unstable = import <nixos-unstable> {config = {allowUnfree = true;};};

  cliPackages = import ./packages/cli.nix {inherit pkgs unstable;};
  desktopPackages = import ./packages/desktop.nix {inherit pkgs unstable;};
  devPackages = import ./packages/dev.nix {inherit pkgs unstable;};
  funPackages = import ./packages/fun.nix {inherit pkgs unstable;};
  miscPackages = import ./packages/misc.nix {inherit pkgs unstable;};
  utilsPackages = import ./packages/utils.nix {inherit pkgs unstable;};

  myPackages = cliPackages ++ desktopPackages ++ devPackages ++ funPackages ++ miscPackages ++ utilsPackages;
in {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = myPackages;

  programs.uwsm.enable = true;

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
  programs.xwayland.enable = true;

  programs.waybar.enable = true;

  programs.steam = {
    enable = true;
    extraCompatPackages = [pkgs.proton-ge-bin];
  };

  programs.zsh.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.obs-studio = {
    enable = true;

    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-gstreamer
      obs-vkcapture
    ];
  };
}
