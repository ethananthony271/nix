{ pkgs, ... }: {
  home.packages = with pkgs; [
    writeShellScriptBin "test" "echo test"
  ];
}
