{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: let
  unstable = import <nixos-unstable> {config = {allowUnfree = true;};};
in {
  services.printing = {
    enable = true;
    drivers = [pkgs.hplip];
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  services.power-profiles-daemon.enable = true;

  users.users.gale = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
    packages = with pkgs; [
      tree
      unstable.opencode
    ];
    shell = pkgs.nushell;
  };

  users.users.sand = {
    isNormalUser = true;
    extraGroups = [];
    packages = with pkgs; [
      tree
    ];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    niv
    impala
    inkscape
    tinyproxy
    kdePackages.okular
    papers
    packet
    unzip
    darktable
    mission-center
    lact
    warehouse
    sccache
    osu-lazer
    blender
    xz
    gzip
    watchexec
    kdePackages.qt6ct
    zsh
    nh
    hplip
    xh
    blockbench
    cargo-nextest
    libqalculate
    bitwarden-cli
    mcrcon
    prismlauncher
    quickemu
    cargo-audit
    clock-rs
    ngrrram
    gtypist
    foot
    fastfetch
    ollama
    easyeffects
    jq
    git-extras
    cava
    dust
    pass
    libnotify
    bottom
    neovim
    wget
    rustup
    rofi-wayland
    waybar
    flatpak
    clang
    git
    alejandra
    kitty
    wezterm
    nautilus
    curl
    swaynotificationcenter
    stow
    hyprland
    xdg-desktop-portal-hyprland
    polkit
    dconf
    legcord
    chromium
    ripgrep
    fd
    bun
    gh
    rustc
    mangohud
    chromium
    swww
    gitui
    unstable.obsidian
    starship
    hyprlock
    mold-wrapped
    nerd-fonts.monaspace
    bat
    dufs
    yazi
    delta
    tokei
    hyprpicker
    hypridle
    hyprpolkitagent
    hyprsunset
    wl-clipboard
    clipse
    bluetui
    nushell
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.monaspace
    font-awesome
  ];

  nixpkgs.config.allowUnfree = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  programs.hyprland.enable = true;
  programs.xwayland.enable = true;

  programs.steam = {
    enable = true;
    extraCompatPackages = [pkgs.proton-ge-bin];
  };

  programs.zsh.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.gvfs.enable = true;
  services.udisks2.enable = true;

  services.flatpak.enable = true;

  nix.settings.experimental-features = ["nix-command"];

  xdg.mime.defaultApplications = {
    "text/html" = "app.zen_browser.zen.desktop";
    "x-scheme-handler/http" = "app.zen_browser.zen.desktop";
    "x-scheme-handler/https" = "app.zen_browser.zen.desktop";
    "x-scheme-handler/about" = "app.zen_browser.zen.desktop";
    "x-scheme-handler/unknown" = "app.zen_browser.zen.desktop";
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  services.blueman.enable = true;

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

  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
  };

  nix.settings.auto-optimise-store = true;

  # services.tailscale.enable = true;

  services.soft-serve = {
    enable = true;

    settings = {
      name = "Polaris Repos";
      log_format = "text";
      ssh = {
        listen_addr = ":23231";
        public_url = "ssh://polaris:23231";
        max_timeout = 30;
        idle_timeout = 120;
      };
      initial_admin_keys = ["\"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJBhLma7WBBim2qRpEThT1OZNZB2AVdncK3bPsvzN0s/ gale@polaris\""];
    };
  };

  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = ["~."];
    fallbackDns = ["9.9.9.9" "149.112.112.112"];
    dnsovertls = "true";
  };

  networking.networkmanager.enable = true;
  networking.wireless.iwd.enable = true;

  networking.wireless.iwd.settings = {
    IPv6 = {
      Enabled = true;
    };
    Settings = {
      AutoConnect = true;
    };
  };

  networking.nameservers = ["9.9.9.9" "149.112.112.112"];

  networking.networkmanager.wifi.backend = "iwd";
  networking.networkmanager.dns = "systemd-resolved";
}
