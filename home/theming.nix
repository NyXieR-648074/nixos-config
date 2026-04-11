{ pkgs, ... }:

{
  gtk = {
    enable = true;
    iconTheme.name = "Kanagawa";
    theme.name = "Kanagawa-B";
    font.package = pkgs.inter-nerdfont;
    font.name = "Inter";
    font.size = 12;
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
  };
  
  home.pointerCursor = {
    enable = true;
    dotIcons.enable = true;
    gtk.enable = true;
    x11.enable = true;
    package    = pkgs.bibata-cursors;
    name       = "Bibata-Modern-Ice";
    size       = 24;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":";
    };
  };
}
