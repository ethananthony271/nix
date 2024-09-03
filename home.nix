{ pkgs, userSettings, ... }:
{
  imports = [
    ./config/apps/sh.nix
    ./config/apps/git.nix
    ./config/apps/nvim.nix
    # ./config/apps/thunderbird.nix
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
    BOOKMARKS = "/home/ea/Documents/Personal/bookmarks.json";
    CURRCOURSE = "/home/ea/Documents/School/quarter04/currentCourse";
    CURRQUARTER = "/home/ea/Documents/School/quarter04";
    TEMPLATES = "$CURRQUARTER/xlatex/templates";
  };
}
