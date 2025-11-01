{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: {
    nixosConfigurations.polaris = inputs.nixpkgs.lib.nixosSystem {
      extraSpecialArgs = {inherit inputs;};
      modules = [
        {nix.settings.experimental-features = ["nix-command" "flakes"];}
        ./polaris.nix
        /etc/nixos/hardware-configuration.nix
      ];
    };
  };
}
