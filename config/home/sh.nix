{ pkgs, ... }:
let
  myAliases = {
    sudo = "sudo "                                       ;
    ls   = "eza --group-directories-first --hyperlink"   ;
    la   = "ls --all --long --header --git"              ;
    lt   = "ls --tree --level=3"                         ;

    z    = "zellij"                                      ;
    za   = "zellij attach"                               ;
    zd   = "zellij delete-session"                       ;
    zD   = "zellij delete-all-sessions"                  ;
    zk   = "zellij kill-session"                         ;
    zK   = "zellij kill-all-sessions"                    ;
    zp   = "zellij list-aliases"                         ;
    zl   = "zellij list-sessions"                        ;
    zr   = "zellij run"                                  ;
    ze   = "zellij run"                                  ;

    cat  = "bat --theme gruvbox-dark "                   ;

    p    = "python3"                                     ;
    h    = "fc -ln 1 | fzf | wl-copy"                    ;
    v    = "nvim"                                        ;
    c    = "clear"                                       ;
    q    = "exit"                                        ;
    m    = "neomutt"                                     ;
    d    = "yazi"                                        ;
    n    = "ncmpcpp"                                     ;
    y    = "hyprland"                                    ;
    f    = "fzf --preview 'bat --color=always {}'"       ;

    tt   = "sh ~/.config/hypr/scripts/toggleTouchpad.sh" ;
  };
in
  {
  programs.bash = {
    enable = true;
    shellAliases = myAliases;
    historySize = 5000;
    historyFile = "$HOME/.bash_history";
  };

  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
    history = {
      save = 5000;
      size = 5000;
      path = "$HOME/.zsh_history";
      share = true;
      ignoreDups = true;
      ignoreSpace = true;
      ignoreAllDups = true;
    };
    enableCompletion = true;
    autosuggestion = {
      enable = true;
    };
    syntaxHighlighting = {
      enable = true;
    };
    plugins = [ ];
    initExtra = ''
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh

      source "$HOME/.zsh/spaceship/spaceship.zsh"

      bindkey '^f' autosuggest-accept
      bindkey '^k' history-search-backward
      bindkey '^j' history-search-forward
      bindkey '^[w' kill-region

      eval "$(fzf --zsh)"
      eval "$(zoxide init --cmd cd zsh)"
    '';
  };

  home.file = {
    ".config/spaceship.zsh" = {
      source = ./sources/sh/spaceship.zsh;
      executable = true;
      recursive = false;
    };
  };

  home.packages = with pkgs; [
    git
    zsh
    bash
    fd
    bat
    eza
    gping
    delta
    ripgrep
    zoxide
    fzf
    delta
    jq
    moreutils
    xdg-utils
    bottom
    imagemagick
    poppler_utils
    wget
    croc
    typioca
    killall

    python3
  ];
}
