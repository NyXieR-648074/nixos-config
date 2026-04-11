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
    hosts = {
      desktop = {
        stateVersion = "25.11";
        system       = "x86_64-linux";
      };
    };
  in{
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit username usernameDescription inputs; stateVersion = hosts.desktop.stateVersion; };
        system = hosts.desktop.system;
        modules = [
          ./hosts/desktop

          home-manager.nixosModules.home-manager{
            home-manager.useGlobalPkgs = true;
            home-manager.extraSpecialArgs = { inherit username; stateVersion = hosts.desktop.stateVersion; };
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.${username} = import ./home;         
          }
        ];
      };
    };
  };
}
