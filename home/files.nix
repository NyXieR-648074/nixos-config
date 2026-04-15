{ ... }:

{
  home.file = {
    # fish
    ".config/fish/config.fish".source = ../dotfiles/fish/config.fish;

    # alacritty
    ".config/alacritty/alacritty.toml".source = ../dotfiles/alacritty/alacritty.toml;

    # btop
    ".config/btop/btop.conf".source = ../dotfiles/btop/btop.conf;

    # fastfetch
    ".config/fastfetch/config.jsonc".source = ../dotfiles/fastfetch/config.jsonc;
    ".config/fastfetch/figlet-3d-logo.txt".source = ../dotfiles/fastfetch/figlet-3d-logo.txt;
        ".config/fastfetch/nixos-small.txt".source = ../dotfiles/fastfetch/nixos-small.txt;

##    # mangowc
##    ".config/mango/config.conf".source = ../dotfiles/mangowc/config.conf;
##    ".config/mango/reload.sh".source = ../dotfiles/mangowc/reload.sh;
##    ".config/mango/start.sh".source = ../dotfiles/mangowc/start.sh;

    # nvim
    ".config/nvim/init.lua".source = ../dotfiles/nvim/init.lua;

    # fontconfig
    ".config/fontconfig/conf.d/60-ui-sans-serif.conf".source = ../dotfiles/fontconfig/60-ui-sans-serif.conf;

    # waybar
    ".config/waybar/power_menu.xml".source = ../dotfiles/waybar/power_menu.xml;
    ".config/waybar/config.jsonc".source = ../dotfiles/waybar/config.jsonc;
    ".config/waybar/style.css".source = ../dotfiles/waybar/style.css;

    # sway
    ".config/sway/config".source = ../dotfiles/sway/config;
    ".config/sway/start.sh".source = ../dotfiles/sway/start.sh;
  };
}
