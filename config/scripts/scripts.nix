{ pkgs, ... }: 
let
  courseInfo = pkgs.writeShellApplication {
    name = "courseInfo";
    runtimeInputs = [
      pkgs.jq
    ];
    text = builtins.readFile ./courseInfo;
  };
  courseTools = pkgs.writeShellApplication {
    name = "courseTools";
    runtimeInputs = [
      pkgs.jq
    ];
    text = builtins.readFile ./courseTools;
  };
in {
  home.packages = [
    courseInfo
    courseTools
  ];
}
