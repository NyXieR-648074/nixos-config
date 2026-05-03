{
  description = "a nix flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
     polymc.url = "github:PolyMC/PolyMC";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs"; 
    };
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nixpkgs-unstable, ... }:
  let
    username            = "nyxier";
    usernameDescription = "NyXieR";
    hosts = {
      desktop = {
        stateVersion = "25.11";
        system       = "x86_64-linux";
        hostname     = "desktop";
      };
    };
    pkgs-unstable = import nixpkgs-unstable {
    system = hosts.desktop.system;
    config.allowUnfree = true;
  };
  in{
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit username usernameDescription pkgs-unstable inputs; stateVersion = hosts.desktop.stateVersion; hostname = hosts.desktop.hostname; };
        system = hosts.desktop.system;
        modules = [
          ./hosts/desktop

          home-manager.nixosModules.home-manager{
            home-manager.useGlobalPkgs = true;
            home-manager.extraSpecialArgs = { inherit username pkgs-unstable; stateVersion = hosts.desktop.stateVersion; hostname = hosts.desktop.hostname; };
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.${username} = import ./home;         
          }
        ];
      };
    };
  };
}
