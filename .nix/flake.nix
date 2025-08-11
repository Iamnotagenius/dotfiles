{
  inputs = {
    nixpkgs.url = "https://releases.nixos.org/nixos/25.05/nixos-25.05.808020.c5f08b62ed75/nixexprs.tar.xz";
    nixpkgs-unstable.url = "https://releases.nixos.org/nixos/unstable/nixos-25.11pre841808.85dbfc7aaf52/nixexprs.tar.xz";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager }@inputs: {
    nixosConfigurations.NixOSBook = nixpkgs.lib.nixosSystem {
      modules = [ ./configuration.nix ];
      specialArgs.inputs = inputs;
      system = "x86_64-linux";
    };
  };
}
