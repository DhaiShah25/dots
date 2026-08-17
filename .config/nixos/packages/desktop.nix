{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    hypridle
    hyprpolkitagent
    hyprsunset
    hyprcursor
    hyprpaper

    wlr-which-key

    kdePackages.ocean-sound-theme
    catppuccin-cursors.frappeDark

    tofi
    nautilus

    ghostty
    foot

    quickshell

    easyeffects
    pavucontrol

    ungoogled-chromium
  ];
}
