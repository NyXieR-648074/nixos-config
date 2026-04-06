{ username, inputs, ... }:

{
  nix = {
    nixPath = [
      "nixpkgs=${inputs.nixpkgs}"
      "nixos-config=/home/${username}/nix-mangowc-dotfiles/config.nix"
    ];
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
