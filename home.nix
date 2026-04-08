{ config, pkgs, username, ... }:

{
  home.username = username; 
  home.homeDirectory = "/home/${username}";
  home.packages = with pkgs; [
    # pkgs
  ];
  programs.home-manager.enable = true;
  home.file = {
    ".config/fish/config.fish".source = ./dotfiles/fish/config.fish;
    ".config/alacritty/alacritty.toml".source = ./dotfiles/alacritty/alacritty.toml;
    ".config/btop/btop.conf".source = ./dotfiles/btop/btop.conf;
    ".config/fastfetch/config.jsonc".source = ./dotfiles/fastfetch/config.jsonc;
    ".config/fastfetch/figlet-3d-logo".source = ./dotfiles/fastfetch/figlet-3d-logo;
    ".config/mango/config.conf".source = ./dotfiles/mangowc/config.conf;
    ".config/mango/reload.sh".source = ./dotfiles/mangowc/reload.sh;
    ".config/mango/start.sh".source = ./dotfiles/mangowc/start.sh;
    ".config/nvim/init.lua".source = ./dotfiles/nvim/init.lua;
  };

  
  home.file.".config/fontconfig/conf.d/60-ui-sans-serif.conf".text = ''
  <?xml version="1.0"?>
  <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
  <fontconfig>
    <alias>
      <family>ui-sans-serif</family>
      <prefer>
        <family>Inter</family>
        <family>Noto Sans</family>
        <family>DejaVu Sans</family>
      </prefer>
    </alias>

    <alias>
      <family>system-ui</family>
      <prefer>
        <family>Inter</family>
        <family>Noto Sans</family>
        <family>DejaVu Sans</family>
      </prefer>
    </alias>
  </fontconfig>
'';

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":";
    };
  };
  xdg.userDirs = {
    enable = true;
    documents   = "${config.home.homeDirectory}/Documents";
    download    = "${config.home.homeDirectory}/Downloads";
    music       = "${config.home.homeDirectory}/Music";
    pictures    = "${config.home.homeDirectory}/Pictures";
    videos      = "${config.home.homeDirectory}/Videos";
    createDirectories = true;
  };
  home.stateVersion = "25.11";
}
