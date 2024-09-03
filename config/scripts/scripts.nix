{ pkgs, ... }: 
let
  courseInfo = pkgs.writeShellApplication {
    name = "courseInfo";
    runtimeInputs = [
      jq
      sed
    ];
    text = builtins.readFile ./courseInfo;
  };
  courseTools = pkgs.writeShellApplication {
    name = "courseTools";
    runtimeInputs = [
      jq
      sed
    ];
    text = builtins.readFile ./courseTools;
  };
  importMusic = pkgs.writeShellApplication {
    name = "importMusic";
    runtimeInputs = with pkgs; [
      yt-dlp
      beet
      sed
    ];
    text = builtins.readFile ./importMusic;
  };
in {
  home.packages = [
    courseInfo
    courseTools
  ];
}
