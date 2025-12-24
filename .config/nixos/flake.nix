{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    fenix,
    home-manager,
    ...
  } @ inputs: {
    nixosConfigurations.polaris = nixpkgs.lib.nixosSystem {
      modules = [
        ./polaris.nix
        ./hardware-configuration.nix
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.gale = ./home.nix;
          nixpkgs.overlays = [fenix.overlays.default];
        }
      ];
    };
  };
}
