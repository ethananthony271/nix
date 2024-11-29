{ inputs, pkgs, ... }: {

  home.file = {
    ".config/hypr" = {
      source = ./sources/hypr;
      executable = false;
      recursive = true;
    };
  };

  # home.file = {
  #   ".config/waybar" = {
  #     source = ./sources/waybar;
  #     executable = false;
  #     recursive = true;
  #   };
  # };

  imports = [ inputs.ags.homeManagerModules.default ];
  programs.ags = {
    enable = true;
    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
    ];
  };

  home.file = {
    ".config/mako/config" = {
      source = ./sources/mako/config;
      executable = false;
      recursive = false;
    };
  };

  #### HYPRLAND TRANSFORMATION ####
  # Hyprpaper
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "/home/ea/.dotfiles/config/home/sources/hypr/assets/grove.png"
      ];
      wallpaper = [
        ",/home/ea/.dotfiles/config/home/sources/hypr/assets/grove.png"
      ];
    };
  };

  # Hyprlock
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        no_fade_in = false;
        grace = 0;
        disable_loading_bar = false;
      };

      background = [{
        monitor = "";
        path = "/home/ea/.dotfiles/config/home/sources/hypr/assets/grove.png";
        blur_passes = 3;
        contrast = 0.8916;
        brightness = 0.8172;
        vibrancy = 0.1696;
        vibrancy_darkness = 0.0;
      }];

      label = [{
        # Current Date
        monitor = "";
        text = ''cmd[update:1000] echo "<span>$(date '+%A, %d %b')</span>"'';
        color = "rgba(225, 225, 225, 0.75)";
        font_size = 30;
        font_family = "Fira Code Nerd Font Mono";
        position = "0, -60";
        halign = "center";
        valign = "top";
      } {
        # Current Time
        monitor = "";
        text = ''cmd[update:1000] echo "$(date +'%H:%M')"'';
        color = "rgba(250, 189, 47, .75)";
        font_size = 120;
        font_family = "MesloLGS NF";
        position = "0, -90";
        halign = "center";
        valign = "top";
      } {
        # Song Info
        monitor = "";
        text = "cmd[update:1000] echo $(~/songDetails.sh)";
        color = "rgba(235, 219, 178, .75)";
        font_size = 16;
        font_family = "Fira Code Nerd Font Mono";
        position = "0, 50";
        halign = "center";
        valign = "bottom";
      }];

      input-field = [{
        monitor = "";
        rounding = -0.5;
        outline_thickness = 0;
        outer_color = "rgba(0, 0, 0, 0)";
        inner_color = "rgba(150, 150, 150, 0.35)";
        font_color = "rgb(200, 200, 200)";

        dots_size = 0.38; # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.2; # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true;

        fade_on_empty = false;
        font_family = "Fira Code Nerd Font Mono";
        placeholder_text = "";

        check_color = "rgba(60, 56, 54, 0.5)";

        fail_color = "rgba(204, 36, 29, 0.75)";
        fail_text = "";
        fail_timeout = 2000;
        fail_transition = 300;

        capslock_color = "rgba(250, 189, 47, 0.35)";
        numlock_color = -1;
        bothlock_color = -1;

        size = "290, 30";
        hide_input = false;
        position = "0, 0";
        halign = "center";
        valign = "center";
      }];
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
    # waybar
    pamixer
    brightnessctl
    wev
    foot
    meslo-lgs-nf
    fira-code-nerdfont
  ];

  home.sessionVariables = {
    BOOKMARKS = "/home/ea/Documents/Personal/bookmarks.json";
  };

}
