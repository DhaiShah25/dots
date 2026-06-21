{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    hyprlock
    hypridle
    hyprpicker
    hyprpolkitagent
    xdg-desktop-portal-hyprland
    hyprland-qt-support
    hyprsunset
    hyprcursor
    hyprpaper

    kdePackages.ocean-sound-theme
    catppuccin-cursors.frappeDark

    librewolf

    tofi
    cosmic-files

    ghostty
    foot

    quickshell

    easyeffects
    pavucontrol

    localsend
    mpv
  ];
}
