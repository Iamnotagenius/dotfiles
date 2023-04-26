{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/38da99614344a1e3964aaee85ea3aad7f68d6109";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, home-manager }@inputs: {
    nixosConfigurations.NixOSBook = nixpkgs.lib.nixosSystem {
      modules = [ ./configuration.nix ];
      specialArgs.inputs = inputs;
      system = "x86_64-linux";
    };
  };
}
