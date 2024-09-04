{ pkgs, ... }: 
let
  courseInfo = pkgs.writeShellApplication {
    name = "courseInfo";
    runtimeInputs = with pkgs; [
      jq
      gnused
    ];
    text = builtins.readFile ./scripts/courseInfo;
  };
in {
  home.packages = [
    courseInfo
  ];
}
