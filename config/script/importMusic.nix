{ pkgs, ... }: 
let
  importMusic = pkgs.writeShellApplication {
    name = "importMusic";
    runtimeInputs = with pkgs; [
      yt-dlp
      beets
      gnused
    ];
    text = builtins.readFile ./scripts/importMusic;
  };
in {
  home.packages = [
    importMusic
  ];
}
