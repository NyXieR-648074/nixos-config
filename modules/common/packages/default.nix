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
    gimp2
    foot
    nginx
    polymc

    polkit_gnome
    quickshell
    librewolf
    tree
    waybar
    pcmanfm
    vscodium
    zed-editor
    btop
    swww
    mkcert
    chromium
    firefox
    figlet
    tailscale
    lua-language-server
    toilet
    pavucontrol
    nmgui
    gnome-calendar
    git
    telegram-desktop
    lmstudio
    sillytavern
    nixd
    corectrl

    nil
    sillytavern
    fd
    ripgrep
    kanagawa-gtk-theme
    kanagawa-icon-theme
    bibata-cursors
    jdk21
    unimatrix
    cbonsai
    cava
    wireshark
    lavat
    # PHP Core
    php
    phpPackages.composer

    # Language Servers
    nodePackages.intelephense     # Superior PHP indexing (standard)
    # phpactor                    # Alternative (excellent for refactoring)
    vscode-langservers-extracted  # Provides HTML, CSS, and JSON LSPs

    # Formatters & Linters
    phpPackages.php-cs-fixer
    nodePackages.prettier         # Best for HTML/CSS formatting
  ];
  programs.xwayland.enable=true;
  programs.fish.enable = true;
  programs.sway.enable=true;
    programs.sway.package = pkgs.swayfx;
  programs.neovim = {
    enable  = true;
    defaultEditor = true;
  };
  programs.dconf.enable = true;
    xdg.portal.config = {
    common = {
        default = [
            "wlr"
        ];
    };
  };
  xdg.portal.enable = true;
  xdg.portal.wlr.enable = true;
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-gtk
  ];

}
