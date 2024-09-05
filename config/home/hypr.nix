{ pkgs, ... }: {

  home.file = {
    ".config/hypr" = {
      source = ./sources/hypr;
      executable = false;
      recursive = true;
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
  ];

}
