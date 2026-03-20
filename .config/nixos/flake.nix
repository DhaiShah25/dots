{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    nixosConfigurations.polaris = nixpkgs.lib.nixosSystem {
      modules = [
        ./polaris.nix
        ./hardware-configuration.nix
      ];
    };
  };
}
