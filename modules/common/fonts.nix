{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    packages = with pkgs; [
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

    fontconfig = {
      enable         = true;  
      antialias      = true;
      hinting.enable = true;
      hinting.style  = "slight";
      subpixel.rgba  = "rgb";
      subpixel.lcdfilter = "default";
      defaultFonts = {
        monospace = [
          "JetBrainsMono Nerd Font Propo"
          "Inter"
          "Noto Sans"
          "Noto Sans CJK JP"
          "Noto Sans CJK SC"
          "Noto Sans CJK KR"
          "Noto Sans CJK TC"
          "Noto Sans CJK HK"
        ];
        serif = [
          "Inter"
          "Noto Sans"
          "Noto Sans CJK JP"
          "Noto Sans CJK SC"
          "Noto Sans CJK KR"
          "Noto Sans CJK TC"
          "Noto Sans CJK HK"
        ];
        sansSerif = [
          "Inter"
          "Noto Sans"
          "Noto Sans CJK JP"
          "Noto Sans CJK SC"
          "Noto Sans CJK KR"
          "Noto Sans CJK TC"
          "Noto Sans CJK HK"
        ];
      };
    };
  };
}
