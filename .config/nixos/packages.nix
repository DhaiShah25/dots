{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: let
  unstable = import <nixos-unstable> {config = {allowUnfree = true;};};
in {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    impala
    bubblewrap
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
    blender
    xz
    gzip
    watchexec
    zsh
    xh
    blockbench
    cargo-nextest
    libqalculate
    bitwarden-cli
    mcrcon
    prismlauncher
    quickemu
    cargo-audit
    ngrrram
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
    wl-clipboard
    clipse
    bluetui
    nushell
    icecream
    npins
    mitmproxy
    jujutsu
    typst
    pandoc
    oha
    zoxide
    oterm
    wlsunset
    chezmoi
    gen-license
    butler
    renderdoc
    matugen
    ffmpeg
    xorg.xprop
    pnpm
    nodejs
    taplo
    grimblast
    tealdeer
    kondo
    typescript-language-server
    emmet-language-server
    ruff
    stylua
    prettierd
    presenterm
    resvg
  ];

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
