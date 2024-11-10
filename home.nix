{ pkgs, userSettings, ... }:
{
  imports = [
    ./config/home/hypr.nix
    ./config/home/cursor.nix
    ./config/home/sh.nix
    ./config/home/git.nix
    ./config/home/nvim.nix
    ./config/home/mpd.nix
    ./config/home/yazi.nix
    ./config/home/mime.nix
    ./config/home/zathura.nix
    ./config/home/swayimg.nix
    ./config/home/foot.nix
    ./config/home/keepass.nix
    ./config/home/gaming.nix
    ./config/home/importMusic.nix
    ./config/script/courseInfo.nix
    ./config/script/courseTools.nix
  ];

  home.stateVersion = "24.05";

  home.username = "ea";
  home.homeDirectory = "/home/ea";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    git
    zsh
    bash

    keepassxc
    thunderbird
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    MANPAGER = "nvim +Man!";
    CURRCOURSE = "/home/ea/Documents/School/currentCourse";
    CURRQUARTER = "/home/ea/Documents/School/quarter04";
    TEMPLATES = "$CURRQUARTER/xlatex/templates";
  };
}
