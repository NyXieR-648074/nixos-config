{ username, inputs, pkgs, ... }:

{
  nix = {
    nixPath = [
      "nixpkgs=${inputs.nixpkgs}"
      "nixos-config=/home/${username}/nixos-config/config.nix"
    ];
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 10d";
    };
    package = pkgs.lixPackageSets.stable.lix;
  };

  nixpkgs = {
    overlays = [ (final: prev: {
      inherit (prev.lixPackageSets.stable)
        nixpkgs-review
        nix-eval-jobs
        nix-fast-build
        colmena;
    }) ];
    config = {
      allowUnfree = true;
    };
  };

}
