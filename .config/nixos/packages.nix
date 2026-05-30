{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  programs.hyprland.enable = true;

  programs.firejail.enable = true;

  programs.xwayland.enable = true;

  programs.steam = {
    enable = true;
    extraCompatPackages = [pkgs.proton-ge-bin];
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
