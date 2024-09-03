{ config, pkgs, ... }:
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
    enableCompletion = false;
    plugins = [
      {
        name = "zsh-completions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-completions";
          rev = "0.27.0";
          sha256 = "1c2xx9bkkvyy0c6aq9vv3fjw7snlm0m5bjygfk5391qgjpvchd29";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "master";
          sha256 = "0zmq66dzasmr5pwribyh4kbkk23jxbpdw4rjxx0i7dx8jjp2lzl4";
        };
        file = "zsh-syntax-highlighting.zsh";
      }
    ];
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
