{ pkgs, ... }: {

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
