{ pkgs, ... }: 
let
  courseTools = pkgs.writeShellApplication {
    name = "courseTools";
    runtimeInputs = with pkgs; [
      jq
      gnused
    ];
    text = builtins.readFile ./scripts/courseTools;
  };
in {
  home.packages = [
    courseTools
  ];
}
