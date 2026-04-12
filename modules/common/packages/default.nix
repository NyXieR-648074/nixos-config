{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    mangowc
    fastfetch
    alacritty
    rofi
    yazi
    zed
    qbittorrent
    gimp
    librewolf
    tree
    waybar
    pcmanfm
    vscodium
    btop
    swww
    figlet
    lua-language-server
    toilet
    git
    nixd
    fd
    ripgrep
    kanagawa-gtk-theme
    kanagawa-icon-theme
    bibata-cursors
    unimatrix
    cbonsai
    cava
    lavat
  ];
  programs.xwayland.enable=true;
  programs.fish.enable = true;
  programs.neovim = {
    enable  = true;
    defaultEditor = true;
  };
  programs.dconf.enable = true;

}
