{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  services.printing.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  users.users.gale = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    packages = with pkgs; [
      tree
    ];
    shell = pkgs.nushell;
  };

  environment.systemPackages = with pkgs; [
    libnotify
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
    kdePackages.dolphin
    curl
    kondo
    swaynotificationcenter
    steam
    stow
    hyprland
    xdg-desktop-portal-hyprland
    polkit
    dconf
    legcord
    chromium
    ripgrep
    fd
    vulkan-tools
    prettierd
    bun
    gh
    rustc
    stylua
    ruff
    mangohud
    bitwarden-desktop
    chromium
    hyprpaper
    gitui
    obsidian
    nushell
    tmux
    starship
    hyprlock
    mold
    typescript-language-server
    emmet-language-server
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
    font-awesome
    wl-clipboard
    clipse
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.monaspace
    font-awesome
  ];

  nixpkgs.config.allowUnfree = true;

  programs.hyprland.enable = true;
  programs.xwayland.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.gvfs.enable = true;
  services.udisks2.enable = true;

  services.flatpak.enable = true;
}
