{ stateVersion, ... }:

{
  imports = [
    ./boot.nix
    ./hardware-configuration.nix
    ../../modules/common
    ../../modules/packages
    ../../modules/services
  ];
  networking.hostName = "desktop";
  system.stateVersion = stateVersion; # sytem state version, do NOT change
}

