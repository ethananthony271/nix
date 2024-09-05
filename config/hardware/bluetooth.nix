{ pkgs, ... }: {
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      Experimental = true;
    };
  };

  environment.systemPackages = with pkgs; [
    bluez
  ];
}
