{
  pkgs,
  lib,
  config,
  ...
}: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  fonts.packages = with pkgs; [
    nerd-fonts.monaspace
  ];

  imports = [
    ./packages.nix
    ./services.nix
    ./networking.nix
    ./users.nix
  ];

  console = {
    enable = true;
    colors = [
      "292c3c"
      "e78284"
      "a6d189"
      "e5c890"
      "8caaee"
      "f4b8e4"
      "81c8be"
      "b5bfe2"
      "626880"
      "e78284"
      "a6d189"
      "e5c890"
      "8caaee"
      "f4b8e4"
      "81c8be"
      "a5adce"
    ];
  };

  nix = {
    channel.enable = false;
    package = pkgs.lixPackageSets.latest.lix;
    settings.experimental-features = ["nix-command" "flakes"];
  };

  zramSwap = {
    enable = true;
    priority = 25;
    algorithm = "lz4";
    memoryPercent = 50;
  };

  system.activationScripts.report-changes = ''
    PATH=$PATH:${lib.makeBinPath [pkgs.lix-diff pkgs.lixPackageSets.latest.lix]}
    lix-diff $(ls -dv /nix/var/nix/profiles/system-*-link | tail -2 | head -1)
  '';

  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?
}
