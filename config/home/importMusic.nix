{ pkgs, ... }: 
let
  importMusic = pkgs.writeShellApplication {
    name = "importMusic";
    runtimeInputs = with pkgs; [
      yt-dlp
      beets
      gnused
    ];
    text = builtins.readFile ./sources/importMusic;
  };
in {

  home.file = {
    ".config/yt-dlp" = {
      source = ./sources/yt-dlp;
      executable = false;
      recursive = true;
    };
  };

  home.file = {
    ".config/beets" = {
      source = ./sources/beets;
      executable = false;
      recursive = true;
    };
  };

  home.packages = [
    importMusic
  ];
}
