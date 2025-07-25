{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: let
  nix-minecraft = builtins.getFlake "github:Infinidoge/nix-minecraft";
in {
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

  nix.settings.experimental-features = ["nix-command" "flakes"];

  xdg.mime.defaultApplications = {
    "text/html" = "app.zen_browser.zen.desktop";
    "x-scheme-handler/http" = "app.zen_browser.zen.desktop";
    "x-scheme-handler/https" = "app.zen_browser.zen.desktop";
    "x-scheme-handler/about" = "app.zen_browser.zen.desktop";
    "x-scheme-handler/unknown" = "app.zen_browser.zen.desktop";
  };

  imports = [nix-minecraft.nixosModules.minecraft-servers];
  nixpkgs.overlays = [nix-minecraft.overlay];

  services.minecraft-servers = {
    enable = true;
    eula = true;

    servers.gale = {
      enable = true;
      package = pkgs.paperServers.paper-1_21_8;

      serverProperties = {
        gamemode = "survival";
        difficulty = "easy";
        simulation-distance = 4;
        level-seed = "67_34shjbfabhj37";
      };

      jvmOpts = [
        "-Xms1G" # Minimum RAM (adjust based on your server's resources)
        "-Xmx2G" # Maximum RAM (adjust based on your server's resources)
        "-XX:+UseG1GC"
      ];
    };
  };

  networking.firewall.allowedUDPPorts = [19132]; # Default GeyserMC Bedrock port
  networking.firewall.allowedTCPPorts = [25565];
}
