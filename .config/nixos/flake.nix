{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  nixConfig = {
    extra-substituters = ["https://nix-community.cachix.org"];
    extra-trusted-public-keys = ["nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="];
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    ...
  }: {
    nixosConfigurations.polaris = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
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
