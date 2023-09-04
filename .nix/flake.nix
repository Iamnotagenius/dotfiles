{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/25e9c5bb4854d93a59bddc8b8ce2b8414db7d56b";
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
