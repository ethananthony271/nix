{ pkgs, ... }: {
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      Experimental = true;
    };
  };

  hardware.pulseaudio.enable = true;

  environment.systemPackages = with pkgs; [
    bluez
  ];
}
