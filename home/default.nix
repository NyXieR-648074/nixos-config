{ stateVersion, username, ... }:

{
  imports = [
    ./files.nix
    ./theming.nix
    ./xdg-dirs.nix
  ];

  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = stateVersion;
  };

  programs.home-manager.enable = true;
}
