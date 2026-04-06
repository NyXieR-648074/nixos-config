{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts-cjk-sans
    noto-fonts
    noto-fonts-cjk-serif
    inter
    nerd-fonts.arimo
    nerd-fonts.jetbrains-mono
    nerd-fonts.dejavu-sans-mono
    corefonts
    roboto-serif
    vista-fonts
    helvetica-neue-lt-std
    liberation_ttf
    google-fonts
    noto-fonts-color-emoji
    fira-mono
    unifont
    dejavu_fonts
  ];
}

