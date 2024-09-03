{ pkgs, ... }: {

  programs.thunderbird = {
    enable = true;
    profiles.school = {
      isDefault = true;
    };
  };

  home.packages = with pkgs; [
    thunderbird
  ];

}
