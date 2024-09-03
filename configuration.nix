{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "leoito"; # Define your hostname.
  networking.networkmanager.enable = false;
  networking.wireless = {
    enable = true;
    userControlled.enable = true;
    networks."ORBI30".psk = "royallotus939";
    extraConfig = "ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=wheel";
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  time.timeZone = "America/Denver";

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  console = {
    font = "Lat2-Terminus16";
    # keyMap = "us";
    useXkbConfig = true; # use xkb.options in tty.
  };

  services.printing.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # jack.enable = true;
  };

  services.syncthing = {
    enable = true;
    dataDir = "/home/ea";
    user = "ea";
    configDir = "/home/ea/.config/syncthing";
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      devices = {
        "Andy" = { id = "3E42ZYP-3G6CCEP-SLAQBO7-Q3T5NRQ-3RMXHAG-TPXA2NT-7RPBXOK-VM7ZUQI"; };
      };
      folders = {
        "Documents" = {
          id = "4xjn5-5eppj";
          path = "/home/ea/Documents";
          devices = [ "Andy" ];
        };
        "Music" = {
          id = "9jdk1-Pk0ak";
          path = "/home/ea/Music";
          devices = [ "Andy" ];
        };
      };
      gui = {
        user = "ea";
      };
    };
  };

  users.users.ea = {
    isNormalUser = true;
    extraGroups = [ "wheel" "input" "networkmanager" ];
    packages = with pkgs; [];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  environment.systemPackages = with pkgs; [
    git
    neovim
    vim
    rofi-wayland
    eza
    ripgrep
    zsh
    zoxide
    fzf
    bottom
    lazygit
    foot
    zellij
    mpd
    mpc-cli
    ncmpcpp
    wget
    yazi
    waybar
    mako
    libnotify
    firefox
    python3
    luajitPackages.luarocks
    luajitPackages.jsregexp
    clang
    tree-sitter
    nodejs_22
    wl-clipboard
    wl-clip-persist
    fd
    texliveFull
    zathura
    syncthing
    betterbird
    pamixer
    brightnessctl
    nix-prefetch-scripts

    hyprland
    xdg-desktop-portal-hyprland
    hyprshot
    hyprlock
    hyprlang
    hypridle
    hyprpaper
    hyprpicker
    hyprcursor

    python312Packages.python-lsp-server
    nodePackages_latest.bash-language-server
  ];

  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  system.stateVersion = "24.05"; # Did you read the comment?
}
