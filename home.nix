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

  home.stateVersion = "25.11";
}
