{ pkgs, ... }: {

  home.file = {
    ".config/hypr" = {
      source = ./sources/hypr;
      executable = false;
      recursive = true;
    };
  };

  home.file = {
    ".config/waybar" = {
      source = ./sources/waybar;
      executable = false;
      recursive = true;
    };
  };

  home.file = {
    ".config/mako/config" = {
      source = ./sources/mako/config;
      executable = false;
      recursive = false;
    };
  };

  home.packages = with pkgs; [
    hyprland
    hyprshot
    hyprlock
    hyprlang
    hypridle
    hyprpaper
    hyprpicker
    hyprcursor
    xdg-desktop-portal-hyprland
    cliphist
    wl-clipboard
    wl-clip-persist
    grimblast
    mako
    libnotify
    rofi-wayland
    waybar
    pamixer
    brightnessctl
  ];

  home.sessionVariables = {
    BOOKMARKS = "/home/ea/.config/hypr/assets/bookmarks.json";
  }

}
