{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: {
    nixosConfigurations.polaris = inputs.nixpkgs.lib.nixosSystem {
      modules = [
        {nix.settings.experimental-features = ["nix-command" "flakes"];}
        ./polaris.nix
        ./hardware-configuration.nix
        inputs.home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.gale = ./home.nix;
        }
      ];
    };
  };
}
