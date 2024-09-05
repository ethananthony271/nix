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
    ".config/yt-dlp/albumconfig.conf" = {
      source = ./sources/yt-dlp/albumconfig.conf;
      executable = false;
    };
  };

  home.file = {
    ".config/beets/config.yaml" = {
      source = ./sources/beets/config.yaml;
      executable = false;
    };
  };

  home.packages = [
    importMusic
  ];
}
