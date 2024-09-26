{ pkgs, ... }: {
  networking.networkmanager.enable = true;
  networking.hostName = "leoito";
  
  environment.systemPackages = [
    pkgs.networkmanager
    pkgs.networkmanagerapplet
  ];
}
