{
  description = "Nixos-conf flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    
    kickstart-nix-nvim = {
      url = "github:IlleaRo/neovim-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

   outputs = {
      nixpkgs,
      home-manager,
      kickstart-nix-nvim,
      ...
    }:
  let
      system = "x86_64-linux";
  in {
      nixosConfigurations.AroPC = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./nixos/configuration.nix ];
      };

      homeConfigurations.illearo = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
           ./home-manager/home.nix
           ./home-manager/modules/neovim.nix
        ];

	extraSpecialArgs = { inherit kickstart-nix-nvim; };
      };
  };
}
