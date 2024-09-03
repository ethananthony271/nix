{ config, pkgs, lib, ... }:
let
  myAliases = {
    sudo = "sudo "                                                                ;
    ls   = "eza --group-directories-first"                                        ;
    la   = "eza --all --long --header --git --hyperlink --group-directories-first";
    lt   = "eza --hyperlink --tree --group-directories-first --level=3"           ;
    ga   = "git add "                                                             ;
    gs   = "git status "                                                          ;
    gd   = "git diff "                                                            ;
    gc   = "git commit -m "                                                       ;
    gb   = "git branch "                                                          ;
    go   = "git checkout "                                                        ;
    gp   = "git push "                                                            ;
    gm   = "git merge "                                                           ;
    gf   = "git fetch "                                                           ;
    gz   = "lazygit"                                                              ;
    z    = "zellij"                                                               ;
    za   = "zellij attach"                                                        ;
    zd   = "zellij delete-session"                                                ;
    zD   = "zellij delete-all-sessions"                                           ;
    zk   = "zellij kill-session"                                                  ;
    zK   = "zellij kill-all-sessions"                                             ;
    zp   = "zellij list-aliases"                                                  ;
    zl   = "zellij list-sessions"                                                 ;
    zr   = "zellij run"                                                           ;
    ze   = "zellij run"                                                           ;
    cat  = "bat --theme gruvbox-dark "                                            ;
    p    = "python3"                                                              ;
    h    = "fc -ln 1 | fzf | wl-copy"                                             ;
    v    = "nvim"                                                                 ;
    c    = "clear"                                                                ;
    q    = "exit"                                                                 ;
    m    = "neomutt"                                                              ;
    d    = "yazi"                                                                 ;
    n    = "ncmpcpp"                                                              ;
    f    = "fzf --preview 'bat --color=always {}'"                                ;
    btl  = "bluetoothctl"                                                         ;
  };
in
  {
  home.stateVersion = "24.05";

  home.username = "ea";
  home.homeDirectory = "/home/ea";

  home.packages = [
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

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
      # highlight = "fg=blue,bg=white,underline";
    };
    syntaxHighlighting = {
      enable = true;
      # styles = {
      #   command = "fg=green,bold";
      # };
    };
    plugins = [ ];
    initExtra = ''
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh

      bindkey '^f' autosuggest-accept
      bindkey '^k' history-search-backward
      bindkey '^j' history-search-forward
      bindkey '^[w' kill-region

      eval "$(fzf --zsh)"
      eval "$(zoxide init --cmd cd zsh)"
    '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    MANPAGER = "nvim +Man!";
    BOOKMARKS = "/home/ea/Documents/Personal/bookmarks.json";
    CURRCOURSE = "/home/ea/Documents/School/quarter04/currentCourse";
    CURRQUARTER = "/home/ea/Documents/School/quarter04";
    TEMPLATES = "$CURRQUARTER/xlatex/templates";
  };

  programs.home-manager.enable = true;
}
