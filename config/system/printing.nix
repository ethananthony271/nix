{ pkgs, ... }: {
  services.printing = {
    enable = true;
    drivers = [
      pkgs.cnijfilter2
      pkgs.hplip
    ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  environment.systemPackages = with pkgs; [];
}
