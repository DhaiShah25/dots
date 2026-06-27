{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    helium-browser.url = "github:schembriaiden/helium-browser-nix-flake";
    helium-browser.inputs.nixpkgs.follows = "nixpkgs";
  };

  nixConfig = {
    extra-substituters = ["https://nix-community.cachix.org"];
    extra-trusted-public-keys = ["nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="];
  };

  outputs = {
    self,
    nixpkgs,
    helium-browser,
    ...
  } @ inputs: {
    nixosConfigurations.polaris = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        {
          nixpkgs.overlays = [helium-browser.overlays.default];
        }
        ./polaris.nix
        ./hardware-configuration.nix
        ./services.nix
        ./users.nix
        ./packages.nix
        ./networking.nix
        ./packages/cli.nix
        ./packages/create.nix
        ./packages/desktop.nix
        ./packages/dev.nix
        ./packages/misc.nix
        ./packages/utils.nix
        ./packages/fun.nix
      ];
    };
  };
}
