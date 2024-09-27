{ pkgs, ... }: {
  services.printing = {
    enable = true;
    drivers = [ pkgs.cnijfilter2 ];
  };

  environment.systemPackages = with pkgs; [];
}
