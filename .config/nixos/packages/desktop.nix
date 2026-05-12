{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    hyprland
    hyprlock
    hypridle
    hyprpicker
    hyprpolkitagent
    xdg-desktop-portal-hyprland
    hyprland-qt-support
    hyprsunset
    hyprcursor
    hyprpaper

    catppuccin-cursors.frappeDark

    librewolf

    dbus-broker

    pavucontrol

    rofi

    ghostty
    foot

    quickshell

    pcmanfm

    easyeffects

    kdePackages.ocean-sound-theme

    rnote

    tofi

    bitwarden-desktop
  ];
}
