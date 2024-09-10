{ pkgs, ... }: {
  networking.networkmanager.enable = true;
  
  environment.systemPackages = [
    pkgs.networkmanager
    pkgs.networkmanagerapplet
  ];

  # networking.wireless = {
  #   enable = true;
  #   userControlled.enable = true;
  #   networks."ORBI30".psk = "royallotus939";
  #   extraConfig = "ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=wheel";
  # };

  # networking = {
  #   hostName = "leoito";
  #   networkmanager.enable = false;
  #   wireless = {
  #     enable = true;
  #     userControlled.enable = true;
  #     networks."ORBI30" = {
  #       psk = "royallotus939";
  #       priority = 1;
  #     };
  #     networks."Little Hotspot" = {
  #       psk = "joeo1029";
  #       priority = 2;
  #     };
  #     networks.eduroam = {
  #       auth = ''
  #         key_mgmt=WPA-EAP
  #         eap=PWD
  #         identity="ethan.anthony@du.edu"
  #         password="%q{?b3V*Pp"CaG$eu{@HTf=,G"
  #       '';
  #     };
  #     extraConfig = "ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=wheel";
  #   };
  # };
}
