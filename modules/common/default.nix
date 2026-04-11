{ ... }:

{
  imports = [
    ./packages
    ./services
    ./fonts.nix
    ./localization.nix
    ./networking.nix
    ./nix.nix
    ./users.nix
  ];
  zramSwap = {
    enable = true;
    memoryPercent = 50; 
  };
}
