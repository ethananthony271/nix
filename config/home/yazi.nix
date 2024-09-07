{ pkgs, ... }: {

  home.file = {
    ".config/yazi" = {
      source = ./sources/yazi;
      executable = false;
      recursive = true;
    };

    ".config/yazi/keymap.toml" = {
      source = ./sources/yazi/keymap.toml;
      executable = false;
      recursive = false;
    };

    ".config/yazi/theme.toml" = {
      source = ./sources/yazi/theme.toml;
      executable = false;
      recursive = false;
    };

    ".config/yazi/yazi.toml" = {
      source = ./sources/yazi/yazi.toml;
      executable = false;
      recursive = false;
    };
  };

  home.packages = with pkgs; [
    yazi
  ];

}
