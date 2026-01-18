{
  pkgs,
  lib,
  config,
  ...
}: let
  cliPackages = import ./packages/cli.nix {inherit pkgs;};
  desktopPackages = import ./packages/desktop.nix {inherit pkgs;};
  devPackages = import ./packages/dev.nix {inherit pkgs;};
  funPackages = import ./packages/fun.nix {inherit pkgs;};
  miscPackages = import ./packages/misc.nix {inherit pkgs;};
  utilsPackages = import ./packages/utils.nix {inherit pkgs;};

  myPackages = lib.concatLists [cliPackages desktopPackages devPackages funPackages miscPackages utilsPackages];
in {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = myPackages;

  programs.hyprland.enable = true;

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  programs.xwayland.enable = true;

  programs.waybar.enable = true;

  programs.steam = {
    enable = true;
    extraCompatPackages = [pkgs.proton-ge-bin];
  };

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

  programs.git = {
    enable = true;
    config = {
      init = {defaultBranch = "main";};
    };
  };

  programs.nano.enable = false;
}
