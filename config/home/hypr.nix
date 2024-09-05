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
    xdg-desktop-portal-hyprland
    hyprshot
    hyprlock
    hyprlang
    hypridle
    hyprpaper
    hyprpicker
    hyprcursor
    cliphist
    wl-clipboard
    wl-clip-persist
    grimblast
    libnotify
    mako
    libnotify
    rofi-wayland
    waybar
    pamixer
    brightnessctl
    bottom
  ];

  home.sessionVariables = {
    BOOKMARKS = "/home/ea/.config/hypr/assets/bookmarks.json";
  }

}
