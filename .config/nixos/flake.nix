{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    helium = {
      url = "github:schembriaiden/helium-browser-nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    extra-substituters = ["https://nix-community.cachix.org"];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  outputs = {
    nixpkgs,
    helium,
    ...
  } @ inputs: {
    nixosConfigurations.polaris = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        {
          environment.systemPackages = [
            helium.packages."x86_64-linux".default
          ];
        }
        ./polaris.nix
        ./hardware-configuration.nix
        ./services.nix
        ./users.nix
        ./packages.nix
        ./networking.nix
        ./packages
      ];
    };
  };
}
