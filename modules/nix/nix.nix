{ username, inputs, ... }:

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
    };
  };
}
