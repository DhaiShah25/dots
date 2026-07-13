{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    hyprlock
    hypridle
    hyprpolkitagent
    hyprsunset
    hyprcursor
    hyprpaper

    wlr-which-key

    kdePackages.ocean-sound-theme
    catppuccin-cursors.frappeDark

    librewolf

    tofi
    nautilus

    ghostty
    foot

    quickshell

    easyeffects
    pavucontrol

    helium
  ];
}
