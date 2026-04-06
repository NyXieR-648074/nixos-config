{ pkgs, ... }:

{
  services = {
    displayManager = {
      sessionPackages = with pkgs; [
        mangowc # mangowc provides no session file for dm by default 
      ];
      ly.enable=true;
    };

    # keymap for x11
    xserver.xkb = {
      layout = "us";
      variant = "";
    };
  };
}
