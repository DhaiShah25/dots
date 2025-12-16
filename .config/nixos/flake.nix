{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
    home-manager.url = "github:nix-community/home-manager?ref=release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: {
    nixosConfigurations.polaris = inputs.nixpkgs.lib.nixosSystem {
      modules = [
        {nix.settings.experimental-features = ["nix-command" "flakes"];}
        ./polaris.nix
        ./hardware-configuration.nix
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.gale = ./home.nix;
        }
      ];
    };
  };
}
