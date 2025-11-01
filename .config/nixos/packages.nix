{
  pkgs,
  lib,
  inputs,
}: let
  cliPackages = import ./packages/cli.nix;
  desktopPackages = import ./packages/desktop.nix;
  devPackages = import ./packages/dev.nix;
  funPackages = import ./packages/fun.nix;
  miscPackages = import ./packages/misc.nix;
  utilsPackages = import ./packages/utils.nix;

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
