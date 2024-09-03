{ pkgs, userSettings, ... }:
{
  imports = [
    ./sh.nix
  ];

  home.stateVersion = "24.05";

  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    git
    zsh
    bash
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
