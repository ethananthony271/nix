{ pkgs, ... }: {

  home.file = {
    ".config/nvim" = {
      source = ./sources/nvim;
      executable = false;
      recursive = true;
    };
  };

  home.file = {
    ".config/test/test.txt" = {
      source = ./test/test.txt;
      executable = false;
      recursive = false;
    };
  };

  home.packages = with pkgs; [
    neovim
    python3
    luajitPackages.luarocks
    luajitPackages.jsregexp
    clang
    tree-sitter
    nodejs_22
    python312Packages.python-lsp-server
    nodePackages_latest.bash-language-server
  ];

}
