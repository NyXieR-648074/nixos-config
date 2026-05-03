{ username, inputs, pkgs-unstable, pkgs, ... }:

{

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "daily";
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
      }) 
       inputs.polymc.overlay
    ];

    config = {
      allowUnfree = true;
      packageOverrides = pkgs: {
        ollama-vulkan = pkgs-unstable.ollama-vulkan;
        ollama-rocm   = pkgs-unstable.ollama-rocm;
        ollama        = pkgs-unstable.ollama;
        lmstudio      = pkgs-unstable.lmstudio;
        open-webui      = pkgs-unstable.open-webui;
        
        
      };

    };
  };

}
