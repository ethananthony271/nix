{ pkgs, ... }: 
let
  courseInfo = pkgs.writeShellApplication {
    name = "courseInfo";
    runtimeInputs = with pkgs; [
      jq
      gnused
    ];
    text = builtins.readFile ./courseInfo;
  };
  courseTools = pkgs.writeShellApplication {
    name = "courseTools";
    runtimeInputs = with pkgs; [
      jq
      gnused
    ];
    text = builtins.readFile ./courseTools;
  };
  importMusic = pkgs.writeShellApplication {
    name = "importMusic";
    runtimeInputs = with pkgs; [
      yt-dlp
      beets
      gnused
    ];
    text = builtins.readFile ./importMusic;
  };
in {
  home.packages = [
    courseInfo
    courseTools
    importMusic
  ];
}
