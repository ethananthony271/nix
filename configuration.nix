{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./config/system/bluetooth.nix
      ./config/system/power.nix
      ./config/system/network.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  time.timeZone = "America/Denver";

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 10d";
  };

  console = {
    font = "Lat2-Terminus16";
    # keyMap = "us";
    useXkbConfig = true; # use xkb.options in tty.
  };

  services.printing = {
    enable = true;
    drivers = [ pkgs.cnijfilter2 ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };


  # hardware.printers = {
  #   ensurePrinters = [
  #     {
  #       name = "Dell_1250c";
  #       location = "Home";
  #       deviceUri = "http://192.168.178.2:631/printers/Dell_1250c";
  #       model = "drv:///sample.drv/generic.ppd";
  #       ppdOptions = {
  #         PageSize = "A4";
  #       };
  #     }
  #   ];
  #   ensureDefaultPrinter = "Dell_1250c";
  # };

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
    foot
    neovim
    zellij

    librewolf

    libreoffice

    texliveFull

    syncthing

    nix-prefetch-scripts

    beeper
    thunderbird
    teams-for-linux
    slack
    zoom-us

    clang
    python3

    keepassxc
    keepassxc-go
    keepass-diff

    gnome.nautilus

    logisim
    inkscape
  ];

  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  system.stateVersion = "24.05"; # Did you read the comment?
}
