{ pkgs, username, usernameDescription, ... }:

{
  users = {
    defaultUserShell = pkgs.fish;
    users = {
      ${username} = {
        isNormalUser = true;
        description  = usernameDescription;
        extraGroups  = [ 
          "networkmanager"
          "wheel"
          "wireshark"
        ];
        packages = with pkgs; [
          #pkgs
        ];
      };
    };
  };
}
