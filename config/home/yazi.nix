{ pkgs, ... }: {

  home.file = {
    ".config/yazi" = {
      source = ./sources/yazi;
      executable = false;
      recursive = true;
    };
  };

  home.packages = with pkgs; [
    yazi
  ];

}
