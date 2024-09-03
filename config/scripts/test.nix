{ args, ... }: {
  home.packages = with pkgs; = [
    writeShellApplication {
      name = "test";
      runtimInputs = with pkgs; [
        figlet
        cowsay
      ];
      text = ''
        figlet "test" | cowsay -n
      '';
    };
  ];
}
