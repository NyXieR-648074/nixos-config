{
  description = "a nix flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs"; 
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
  let
    username            = "nyxier";
    usernameDescription = "NyXieR";
  in{
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit username usernameDescription inputs; };
        system = "x86_64-linux";
        modules = [
          { networking.hostName = "desktop"; }

          ./config.nix

          home-manager.nixosModules.home-manager{
            home-manager.useGlobalPkgs = true;
            home-manager.extraSpecialArgs = { inherit username; };
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.${username} = import ./home.nix;         
          }
        ];
      };
    };
  };
}
